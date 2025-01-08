import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:interior_coffee/common/widgets/icon/circular_icon.dart';
import 'package:interior_coffee/common/widgets/image/t_rounded_image.dart';
import 'package:interior_coffee/common/widgets/text/product_title_text.dart';
import 'package:interior_coffee/features/shop/screens/product_details/widget/brand_title_with_verification.dart';
import 'package:interior_coffee/features/shop/screens/product_details/widget/product_price_text.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({ super.key });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    return Container(
        width: 310,
        padding: EdgeInsets.all(1),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(TSizes.productImageRadius),
    color: dark ? TColors.darkerGrey : TColors.softGrey,
    ),
      child: Row(
        children: [
          //Thumbnail
          TRoundedContainer(
            height: 120,
            padding: EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(imageUrl: TImages.productImage1, applyImageRadius: true),
                ),

                //Sale tag
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                  ),
                ),

                //favourite icon button
                Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                ),
              ],
            ),
          ),

          SizedBox(
            width: 172,
            child: Padding(
                padding: EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: 'White luxury armchair', smallSize: true),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      TBrandTitleWithVerifiedIcon(title: 'Zinus'),
                    ],
                  ),

                  Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: TProductPriceText(price: '899.000')),

                      //Add to cart
                      Container(
                        decoration: BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child: SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(child: Icon(Iconsax.add, color: TColors.white)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}