import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/features/authentication/screens/password_configuration/otp_form.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/constants/text_strings.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({ super.key });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: Icon(CupertinoIcons.clear)),
        ],
        iconTheme: IconThemeData(
          color: dark ? TColors.white : TColors.primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(image: AssetImage(TImages.deliveredEmailIllustration), width: THelperFunction.screenWidth() * 0.55),
              SizedBox(height: TSizes.spaceBtwSections),

              //Title and subtitle
              Text(TTexts.changeYourPasswordTitle, style : Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              SizedBox(height: TSizes.spaceBtwItems),
              Text(TTexts.changeYourPasswordSubTitle, style : Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              SizedBox(height: TSizes.spaceBtwSections),

              //otp form
              OtpForm(),
              SizedBox(height: TSizes.spaceBtwSections),

              //Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: Text(TTexts.tContinue)),
              ),
              SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: (){}, child: Text(TTexts.resendEmail, style: TextStyle(color: TColors.primary))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}