import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:interior_coffee/common/widgets/image/t_rounded_image.dart';
import 'package:interior_coffee/features/shop/controllers/home_controller.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => TRoundedImage(imageUrl: url)).toList(),
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  TCircularContainer(
                      width: 20,
                      height: 4,
                      margin: EdgeInsets.only(right: 10),
                      backgroundColor: controller.carouselCurrentIndex.value == i ? TColors.primary : TColors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
