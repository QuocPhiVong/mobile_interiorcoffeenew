import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_coffee/common/widgets/text/section_heading.dart';
import 'package:interior_coffee/features/shop/screens/product_details/widget/bottom_add_to_cart.dart';
import 'package:interior_coffee/features/shop/screens/product_details/widget/product_attribute.dart';
import 'package:interior_coffee/features/shop/screens/product_details/widget/product_detail_image_slider.dart';
import 'package:interior_coffee/features/shop/screens/product_details/widget/product_metadata.dart';
import 'package:interior_coffee/features/shop/screens/product_details/widget/rating_widget.dart';
import 'package:interior_coffee/features/shop/screens/product_review/prodcut_reviews.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TProductImageSlider(),

            //product information
            Padding(
                padding: EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  TRating(),

                  SizedBox(height: TSizes.spaceBtwItems),

                  //product info
                  TProductMetadata(),

                  //product attribute
                  TProductAttributes(),

                  //review and rating
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(title: 'Review (199)', showActionButton: false),
                      IconButton(icon: Icon(Iconsax.arrow_right_3, size: 18), onPressed: ()=> Get.to(()=>ProductReviewsScreen())),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}