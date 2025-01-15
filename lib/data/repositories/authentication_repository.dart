import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/data/dio/api_service.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final ApiService _apiService = ApiService();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
  }

  Future<Map<String, dynamic>?> onLogin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiService.dio.post('/v1/auth/login', data: {
        'email': email,
        'password': password,
      });
      return response.data;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> loginWithGoogle({
    required String email,
  }) async {
    try {
      final response = await _apiService.dio.post('/v1/auth/login-google?email=$email');
      return response.data;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> onRegister({
    required String username,
    required String email,
    required String phoneNumber,
    required String address,
    required String avatar,
    required String password,
  }) async {
    try {
      final response = await _apiService.dio.post('/v1/auth/register', data: {
        "user-name": username,
        "password": password,
        "email": email,
        "phone-number": phoneNumber,
        "address": address,
        "avatar": avatar,
      });
      return response.data;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> onFetchProfile({
    required String mail,
  }) async {
    try {
      final response = await _apiService.dio.get('/v1/accounts/$mail/info');
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
