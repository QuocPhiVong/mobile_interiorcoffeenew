import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/image/t_rounded_image.dart';
import 'package:interior_coffee/features/shop/screens/product_details/widget/brand_title_with_verification.dart';
import 'package:interior_coffee/features/shop/screens/product_details/widget/product_title_text.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Image
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 100,
          height: 100,
          padding: EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunction.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),
        SizedBox(width: TSizes.spaceBtwItems),

        //product name and price
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TBrandTitleWithVerifiedIcon(title: 'Zinus'),
            Flexible(child: TProductTitleText(title: 'White luxury armchair', maxLines: 1)),
            //attributes
            Text.rich(
              TextSpan(
                children:[
                  TextSpan(text: 'Material: ', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: 'Fabric', style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children:[
                  TextSpan(text: 'Dimension: ', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: '60x80x120', style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}