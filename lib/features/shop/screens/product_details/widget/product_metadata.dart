import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:interior_coffee/common/widgets/image/t_circular_image.dart';
import 'package:interior_coffee/common/widgets/text/product_price_text.dart';
import 'package:interior_coffee/common/widgets/text/product_title_text.dart';
import 'package:interior_coffee/features/shop/screens/product_details/widget/brand_title_with_verification.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/enums.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class TProductMetadata extends StatelessWidget {
  const TProductMetadata({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
            ),
            SizedBox(width: TSizes.spaceBtwItems),

            //price
            Text('VND 999', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            SizedBox(width: TSizes.spaceBtwItems),
            TProductPriceText(price: '899', isLarge: true),
          ],
        ),

        SizedBox(height: TSizes.spaceBtwItems/1.5),

        //title
        TProductTitleText(title: 'White luxury armchair'),
        SizedBox(height: TSizes.spaceBtwItems/1.5),
        
        //stock
        Row(
          children: [
            TProductTitleText(title: 'Quantity :'),
            SizedBox(width:TSizes.spaceBtwItems),
            Text('100', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems/1.5),

        //merchant
        Row(
          children: [
            TCircularImage(
                image: TImages.cosmeticsIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(title: 'Zinus', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
