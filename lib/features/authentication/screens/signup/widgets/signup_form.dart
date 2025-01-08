import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_coffee/features/authentication/controllers/auth_controller.dart';
import 'package:interior_coffee/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/constants/text_strings.dart';

class TSignupForm extends StatefulWidget {
  const TSignupForm({
    super.key,
  });

  @override
  State<TSignupForm> createState() => _TSignupFormState();
}

class _TSignupFormState extends State<TSignupForm> {
  final AuthController _authController = AuthController.instance;

  @override
  void initState() {
    super.initState();
    _authController.initController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          //Username
          TextFormField(
            expands: false,
            decoration: InputDecoration(
                labelText: TTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
            controller: _authController.tfUsernameController,
          ),

          SizedBox(height: TSizes.spaceBtwInputField),
          //Email
          TextFormField(
            expands: false,
            decoration: InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
            controller: _authController.tfEmailController,
          ),

          SizedBox(height: TSizes.spaceBtwInputField),
          //Phone number3450-0
          TextFormField(
            expands: false,
            decoration: InputDecoration(
                labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
            controller: _authController.tfPhoneNumberController,
          ),

          SizedBox(height: TSizes.spaceBtwInputField),
          //Password
          TextFormField(
            obscureText: true,
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.newPassword,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
            controller: _authController.tfPasswordController,
          ),
          SizedBox(height: TSizes.spaceBtwInputField),

          //Re-enter password
          TextFormField(
            obscureText: true,
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.confirmPassword,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
            controller: _authController.tfConfirmPasswordController,
          ),

          SizedBox(height: TSizes.spaceBtwSections),
          //term and condition
          TTermsAndConditionCheckbox(),

          SizedBox(height: TSizes.spaceBtwSections),
          //Sign up button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => _authController.onRegister(),
                child: Text(TTexts.createAccount)),
          ),
        ],
      ),
    );
  }
}
