import 'package:flutter/material.dart';
import 'package:interior_coffee/features/authentication/controllers/onboarding_controller.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
            onPressed: () => OnBoardingController.instance.skipPage(),
            child: Text('Skip', style: TextStyle(color: Colors.brown))));
  }
}
