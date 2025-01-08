import 'package:flutter/material.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/constants/text_strings.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
        ),
    
        Text(TTexts.loginTitle, style : Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: TSizes.sm),
        Text(TTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}