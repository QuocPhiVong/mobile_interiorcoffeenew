import 'package:flutter/material.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({ 
    required this.image, 
    required this.title, 
    required this.subTitle,
    super.key
     });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image(
              width: THelperFunction.screenWidth() * 0.8,
              height: THelperFunction.screenHeight() * 0.6,
              image: AssetImage(image)
              ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}