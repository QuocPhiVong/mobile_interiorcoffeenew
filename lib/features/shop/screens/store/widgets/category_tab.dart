import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/brands/brand_show_case.dart';
import 'package:interior_coffee/common/widgets/layout/grid_layout.dart';
import 'package:interior_coffee/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:interior_coffee/common/widgets/text/section_heading.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
    const TCategoryTab ({ super.key });
  
    @override
    Widget build(BuildContext context) {
      return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    //Merchants
                    TBrandShowcase(images: [TImages.productImage1, TImages.productImage2, TImages.productImage3]),
        
                    //product
                    TSectionHeading(title: 'You might like', showActionButton: true, onPressed: (){}),
                    SizedBox(height: TSizes.spaceBtwItems),
        
                    TGridLayout(itemCount: 4, itemBuilder: (_, index)=> TProductCardVertical()),
                    SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              ),
        ],
      );
    }
  }