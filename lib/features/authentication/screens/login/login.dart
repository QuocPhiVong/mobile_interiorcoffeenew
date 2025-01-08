import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/styles/spacing_style.dart';
import 'package:interior_coffee/common/widgets/login_signup/form_divider.dart';
import 'package:interior_coffee/features/authentication/screens/login/widget/login_form.dart';
import 'package:interior_coffee/features/authentication/screens/login/widget/login_header.dart';
import 'package:interior_coffee/common/widgets/login_signup/social_buttons.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //logo and title
              TLoginHeader(),

              ///Form
              TLoginForm(),

              //divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              SizedBox(height: TSizes.spaceBtwSections),

              //footer
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
