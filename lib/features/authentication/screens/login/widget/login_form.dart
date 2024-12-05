import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_coffee/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:interior_coffee/features/authentication/screens/signup/widgets/signup.dart';
import 'package:interior_coffee/navigation_menu.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(child: Padding(
      padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [
          ///Email
          TextFormField(
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.direct_right),labelText: TTexts.email),
          ),
          SizedBox(height: TSizes.spaceBtwInputField),
      
        ///password
        TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: TTexts.password, 
              suffixIcon: Icon(Iconsax.eye_slash)
              ),
          ),
      
          SizedBox(height: TSizes.spaceBtwInputField/2),
      
          //Forgot password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () => Get.to(() => ForgotPassword()), child: Text(TTexts.forgetPassword, style: TextStyle(color: Colors.brown))),
          ],
          ),
      
          SizedBox(height: TSizes.spaceBtwSections),
      
          //sign in button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => NavigationMenu()), child: Text(TTexts.signIn))),
          SizedBox(height: TSizes.spaceBtwItems),
    
          //create account
          SizedBox(
            width: double.infinity, 
            child: OutlinedButton(onPressed: () => Get.to(() => SignupScreen()), child: Text(TTexts.createAccount))),
        ],
      ),
    ),
    );
  }
}