import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/features/authentication/controllers/onboarding_controller.dart';
import 'package:interior_coffee/features/authentication/screens/onboarding/widget/onboarding_dot_navigation.dart';
import 'package:interior_coffee/features/authentication/screens/onboarding/widget/onboarding_page.dart';
import 'package:interior_coffee/features/authentication/screens/onboarding/widget/onboarding_skip.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/constants/text_strings.dart';
import 'package:interior_coffee/utils/device/device_utility.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                  image: TImages.onBoardingImage1,
                  title: TTexts.onBoardingTitle1,
                  subTitle: TTexts.onBoardingSubTitle1),
              OnBoardingPage(
                  image: TImages.onBoardingImage2,
                  title: TTexts.onBoardingTitle2,
                  subTitle: TTexts.onBoardingSubTitle2),
              OnBoardingPage(
                  image: TImages.onBoardingImage3,
                  title: TTexts.onBoardingTitle3,
                  subTitle: TTexts.onBoardingSubTitle3),
            ],
          ),

          //Skip button
          OnBoardingSkip(),

          //Dot navigate
          OnBoardingDotNavigation(),

          //next button
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(shape: CircleBorder(), backgroundColor: dark ? TColors.primary: Colors.brown),
        child: Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}


