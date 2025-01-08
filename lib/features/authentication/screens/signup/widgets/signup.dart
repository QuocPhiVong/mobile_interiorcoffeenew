import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/login_signup/form_divider.dart';
import 'package:interior_coffee/common/widgets/login_signup/social_buttons.dart';
import 'package:interior_coffee/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/constants/text_strings.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: dark ? TColors.white : TColors.primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: TSizes.spaceBtwSections),

              //Form
              TSignupForm(),

              SizedBox(height: TSizes.spaceBtwSections),
              //Divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),

              SizedBox(height: TSizes.spaceBtwItems),
              //social sign up
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
