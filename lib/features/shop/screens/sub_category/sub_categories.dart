import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/common/widgets/image/t_rounded_image.dart';
import 'package:interior_coffee/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:interior_coffee/common/widgets/text/section_heading.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Seating'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Banner
              TRoundedImage(width: double.infinity, imageUrl: TImages.promoBanner3, applyImageRadius: true),
              SizedBox(height: TSizes.spaceBtwSections),

              //Sub category
              Column(
                children: [
                  TSectionHeading(title: 'Seating', onPressed: (){}),
                  SizedBox(height: TSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(width: TSizes.spaceBtwItems),
                        itemBuilder: (context, index) => TProductCardHorizontal(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
