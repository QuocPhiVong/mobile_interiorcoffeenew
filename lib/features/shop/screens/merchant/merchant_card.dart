import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:interior_coffee/common/widgets/image/t_circular_image.dart';
import 'package:interior_coffee/features/shop/screens/product_details/widget/brand_title_with_verification.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/enums.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class TMerchantCard extends StatelessWidget {
  const TMerchantCard({super.key,
    required this.showBorder,
    this.onTap
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      //Container design
      child: TRoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.all(TSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //icon
            Flexible(
              child: TCircularImage(
                isNetworkImage: false,
                image: TImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? TColors.white : TColors.black,
              ),
            ),
            SizedBox(width: TSizes.spaceBtwItems / 2),

            //Text
            Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TBrandTitleWithVerifiedIcon(title: 'Zinus', brandTextSize: TextSizes.large),
                    Text(
                      '25 Products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );

  }
}
