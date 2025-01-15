import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_coffee/common/styles/shadow.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:interior_coffee/common/widgets/icon/circular_icon.dart';
import 'package:interior_coffee/common/widgets/image/t_rounded_image.dart';
import 'package:interior_coffee/common/widgets/text/product_price_text.dart';
import 'package:interior_coffee/common/widgets/text/product_title_text.dart';
import 'package:interior_coffee/common/widgets/text/t_merchat_title_with_verified_icon.dart';
import 'package:interior_coffee/data/response/products_response.dart';
import 'package:interior_coffee/features/shop/screens/product_details/product_detail.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/ref_data.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';
import 'package:intl/intl.dart';

class TProductCardVertical extends StatelessWidget {
  final Product? info;
  const TProductCardVertical({super.key, this.info});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    var formatter = NumberFormat.decimalPattern('vi_VN');

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
            productId: info?.id ?? '',
          )),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),

        //product list
        child: Column(
          children: [
            //Thumbnail
            TRoundedContainer(
              height: 180,
              padding: EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  //product image
                  TRoundedImage(
                    imageUrl: info?.images?.thumbnail ?? TImages.productImage1,
                    applyImageRadius: true,
                    backgroundColor: TColors.white,
                    fit: BoxFit.fill,
                    padding: EdgeInsets.all(1),
                    isNetworkImage: (info?.images?.thumbnail?.isNotEmpty == true),
                  ),

                  /*//sale tag
                  Positioned(
                    top: 0,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                    ),
                  ),*/

                  /*//add to favourite
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                  ),*/
                ],
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems / 2),

            //product details
            Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: info?.name ?? 'White coffee arm chair', smallSize: true),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  TMerchatTitleWithVerifiedIcon(title: 'Tien Phu Furniture'),
                ],
              ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price
                Padding(
                    padding: EdgeInsets.only(left: TSizes.sm),
                    child: TProductPriceText(price: formatter.format(info?.truePrice ?? 0).toString())),

                Container(
                  decoration: BoxDecoration(
                      color: dark ? TColors.dark : TColors.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight: Radius.circular(TSizes.productImageRadius),
                      )),
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
    );
  }
}
