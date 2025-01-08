import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:interior_coffee/common/widgets/text/product_title_text.dart';
import 'package:interior_coffee/common/widgets/text/section_heading.dart';
import 'package:interior_coffee/data/response/products_response.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';
import 'package:readmore/readmore.dart';

class TProductAttributes extends StatelessWidget {
  final Product info;
  const TProductAttributes({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        SizedBox(height: TSizes.md),
        TRoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TSectionHeading(title: 'Variations ', showActionButton: false),
                  SizedBox(height: TSizes.sm),
                  Row(
                    children: [
                      TProductTitleText(title: 'Category : ', smallSize: false),
                      Text('Seating', style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  SizedBox(height: TSizes.sm),
                  Row(
                    children: [
                      TProductTitleText(title: 'Dimension : ', smallSize: false),
                      Text('${info.dimensions} cm', style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  SizedBox(height: TSizes.sm),
                  Row(
                    children: [
                      TProductTitleText(title: 'Material : ', smallSize: false),
                      Text('Fabric', style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: TSizes.spaceBtwItems),

        //product description
        TSectionHeading(title: 'Description', showActionButton: false),
        SizedBox(height: TSizes.spaceBtwItems),
        ReadMoreText(
          info.description ?? '',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: ' Show more',
          trimExpandedText: ' Show less',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
