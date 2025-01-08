import 'package:flutter/material.dart';
import 'package:interior_coffee/common/styles/spacing_style.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/constants/text_strings.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              //Image
              Image(image: AssetImage(image), width: THelperFunction.screenWidth() * 0.6),
              SizedBox(height: TSizes.spaceBtwSections),

              //Title and subtitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              SizedBox(height: TSizes.spaceBtwItems),
              Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              SizedBox(height: TSizes.spaceBtwSections),

              //Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: onPressed, child: Text(TTexts.tContinue)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
