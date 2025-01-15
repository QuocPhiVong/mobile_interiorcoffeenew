import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:interior_coffee/common/widgets/dialog/loading_dialog.dart';
import 'package:interior_coffee/data/repositories/authentication_repository.dart';
import 'package:interior_coffee/data/response/authentication_response.dart';
import 'package:interior_coffee/features/authentication/screens/login/login.dart';
import 'package:interior_coffee/features/authentication/screens/onboarding/onboarding.dart';
import 'package:interior_coffee/navigation_menu.dart';

import '../../../utils/firebase/firebase_authentication.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  String? token;
  Rx<AuthenticationResponse> userData = Rx(AuthenticationResponse());

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  final AuthenticationRepository _authenticationRepository = AuthenticationRepository.instance;

  final FirebaseAuthentication firebaseAuth = FirebaseAuthentication();

  late TextEditingController tfEmailController;
  late TextEditingController tfPasswordController;
  late TextEditingController tfConfirmPasswordController;
  late TextEditingController tfUsernameController;
  late TextEditingController tfPhoneNumberController;

  @override
  void onInit() async {
    super.onInit();
    initController();
    onLoad();
  }

  void onLoad() async {
    await _loadToken();
    _screenRedirect();
  }

  void _screenRedirect() async {
    final deviceStorage = GetStorage();
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true ? _silentLogin() : Get.offAll(OnBoardingScreen());
  }

  void disposeController() {
    tfEmailController.dispose();
    tfPasswordController.dispose();
    tfConfirmPasswordController.dispose();
    tfUsernameController.dispose();
    tfPhoneNumberController.dispose();
  }

  void initController() {
    tfEmailController = TextEditingController();
    tfPasswordController = TextEditingController();
    tfConfirmPasswordController = TextEditingController();
    tfUsernameController = TextEditingController();
    tfPhoneNumberController = TextEditingController();
  }

  bool _isEmailValid() {
    if (!GetUtils.isEmail(tfEmailController.text)) {
      showSnackbar('Error', 'Please enter a valid email');
      return false;
    }
    return true;
  }

  bool _isPasswordValid() {
    final regex = RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!regex.hasMatch(tfPasswordController.text)) {
      showSnackbar('Error',
          'Password must contain at least 8 characters, including letters lower and upper case, numbers and special characters');
      return false;
    } else {
      return true;
    }
  }

  bool _isPasswordMatch() {
    if (tfPasswordController.text != tfConfirmPasswordController.text) {
      showSnackbar('Error', 'Password does not match');
      return false;
    }
    return true;
  }

  bool _isPhoneNumberValid() {
    if (!GetUtils.isPhoneNumber(tfPhoneNumberController.text)) {
      showSnackbar('Error', 'Please enter a valid phone number');
      return false;
    }
    return true;
  }

  Future<void> loginWithGoogle() async {
    try {
      showLoading();
      // Call the function to login account with email and password
      Object? requestBody = await firebaseAuth.signInWithGoogle();
      hideLoading();

      if (requestBody is Map<String, dynamic>) {
        final String email = requestBody['email'] ?? '';

        final res = await _authenticationRepository.loginWithGoogle(email: email);

        if (res == null) {
          hideLoading();
          Future.delayed(Duration(milliseconds: 100), () {
            showSnackbar('Error', 'Email account not found, please sign up first!');
          });
        } else {
          userData.value = AuthenticationResponse.fromJson(res);

          if (userData.value.accessToken?.isNotEmpty == true) {
            await _cacheInfo();
            Get.offAll(() => NavigationMenu());
          } else {
            hideLoading();
            Future.delayed(Duration(milliseconds: 100), () {
              showSnackbar('Error', 'Failed to Login');
            });
          }
        }
      } else {
        print("Invalid response from signInWithGoogle");
      }
    } catch (error) {
      hideLoading();
      print(error);
    }
  }

  Future<void> onLogin() async {
    if (!_isEmailValid()) {
      return;
    } else if (!_isPasswordValid()) {
      return;
    } else {
      hideLoading();
      showLoading();

      final res = await _authenticationRepository.onLogin(
        email: tfEmailController.text,
        password: tfPasswordController.text,
      );

      if (res == null) {
        hideLoading();
        Future.delayed(Duration(milliseconds: 100), () {
          showSnackbar('Error', 'Wrong email or password');
        });
      } else {
        hideLoading();

        userData.value = AuthenticationResponse.fromJson(res);

        if (userData.value.accessToken?.isNotEmpty == true) {
          await _cacheInfo();
          Get.offAll(() => NavigationMenu());
        } else {
          hideLoading();
          Future.delayed(Duration(milliseconds: 100), () {
            showSnackbar('Error', 'Failed to Login');
          });
        }
      }
    }
  }

  Future<void> onRegister() async {
    if (!_isEmailValid()) {
      return;
    } else if (!_isPhoneNumberValid()) {
      return;
    } else if (!_isPasswordValid()) {
      return;
    } else if (!_isPasswordMatch()) {
      return;
    } else {
      showLoading();
      final res = await _authenticationRepository.onRegister(
        username: tfUsernameController.text,
        email: tfEmailController.text,
        phoneNumber: tfPhoneNumberController.text,
        address: '',
        avatar: '',
        password: tfPasswordController.text,
      );
      if (res == null) {
        hideLoading();
        showSnackbar('Error', 'Failed to register');
      } else {
        hideLoading();
        userData.value = AuthenticationResponse.fromJson(res);

        await firebaseAuth.createAccountWithEmailAndPassword(tfEmailController.text, tfPasswordController.text);

        if (userData.value.accessToken?.isNotEmpty == true) {
          await _cacheInfo();
          Get.offAll(() => NavigationMenu());
        } else {
          showSnackbar('Error', 'Failed to register');
        }
      }
    }
  }

  Future<void> _cacheInfo() async {
    token = userData.value.accessToken;
    final email = userData.value.email ?? '';
    await Future.wait([saveToken(userData.value.accessToken ?? ''), saveEmail(email), _onFetchProfile(email)]);
  }

  Future<void> _loadToken() async {
    token = await _secureStorage.read(key: 'auth_token');

    final email = await _secureStorage.read(key: 'email');

    _onFetchProfile(email);

    update();
  }

  Future<void> logout() async {
    token = null;

    await _secureStorage.delete(key: 'auth_token');

    await _secureStorage.delete(key: 'email');

    update();

    await firebaseAuth.signOut();

    Get.find<NavigationController>().selectedIndex.value = 0;

    Get.offAll(() => LoginScreen());
  }

  Future<void> saveToken(String newToken) async {
    token = newToken;

    await _secureStorage.write(key: 'auth_token', value: newToken);

    update();
  }

  Future<void> saveEmail(String email) async {
    await _secureStorage.write(key: 'email', value: email);
  }

  void _silentLogin() {
    if (token != null) {
      Get.offAll(() => NavigationMenu());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

  Future<void> _onFetchProfile(String? email) async {
    if (email != null) {
      await _authenticationRepository.onFetchProfile(mail: email).then((value) {
        if (value != null) {
          userData.value = AuthenticationResponse.fromJson(value);
          update();
        }
      });
    }
  }
}
