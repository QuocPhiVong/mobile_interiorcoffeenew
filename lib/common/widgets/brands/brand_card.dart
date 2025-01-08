import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:interior_coffee/common/widgets/image/t_circular_image.dart';
import 'package:interior_coffee/common/widgets/text/t_merchat_title_with_verified_icon.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/enums.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';


class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key, 
    required this.showBorder, 
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunction.isDarkMode(context);

    return GestureDetector(
    onTap: (){},
    child: TRoundedContainer(
      showBorder : showBorder,
      padding: EdgeInsets.all(TSizes.sm),
      backgroundColor: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //icon
          Flexible(
            child: TCircularImage(
              isNetworkImage: false,
              image: TImages.furnitureIcon,
              backgroundColor: Colors.transparent,
              overlayColor: dark ? TColors.white : TColors.dark,
            ),
          ),
          SizedBox(height: TSizes.spaceBtwItems / 2),
    
          //text
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TMerchatTitleWithVerifiedIcon(title: 'Zinus', brandTextSize: TextSizes.large),
                Text(
                  '256 products',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          )
        ],
      ),
    ),
                        );
  }
}
