import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/brands/brand_card.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';


class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: EdgeInsets.all(TSizes.md),
      child: Column(
        children: [
          TBrandCard(showBorder: false),
          SizedBox(height: TSizes.spaceBtwItems),
    
          //show merchant item under label
          Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList()),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context){
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        padding: EdgeInsets.all(TSizes.md),
        margin: EdgeInsets.only(right: TSizes.sm),
        backgroundColor: THelperFunction.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        child: Image(fit:  BoxFit.contain, image: AssetImage(image)),
      )
    );
  }
}