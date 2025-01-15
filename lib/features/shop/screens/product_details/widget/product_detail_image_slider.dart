import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/curved_edges/curved_edges.widget.dart';
import 'package:interior_coffee/common/widgets/icon/circular_icon.dart';
import 'package:interior_coffee/features/shop/screens/model_viewer/model_viewer.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class TProductImageSlider extends StatelessWidget {
  final String url;
  const TProductImageSlider({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.light : TColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                  padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(child: Image(image: NetworkImage(url)))),
            ),

            //Image slider
            // Positioned(
            //   right: 0,
            //   bottom: 30,
            //   left: TSizes.defaultSpace,
            //   child: SizedBox(
            //     height: 80,
            //     child: ListView.separated(
            //       itemCount: 4,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       physics: AlwaysScrollableScrollPhysics(),
            //       separatorBuilder: (_, __) => SizedBox(width: TSizes.spaceBtwItems),
            //       itemBuilder: (_, index) => TRoundedImage(
            //         width: 80,
            //         backgroundColor: dark ? TColors.dark : TColors.white,
            //         border: Border.all(color: TColors.primary),
            //         padding: EdgeInsets.all(TSizes.sm),
            //         imageUrl: TImages.productImage2,
            //       ),
            //     ),
            //   ),
            // ),


            //Appbar
            TAppBar(
              showBackArrow: true,
              //actions: [TCircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            )
          ],
        ),
      ),
    );
  }
}
