import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/common/widgets/products/ratings/ratings_indicator.dart';
import 'package:interior_coffee/features/shop/screens/product_review/widget/rating_progress_indicator.dart';
import 'package:interior_coffee/features/shop/screens/product_review/widget/user_reviews_card.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: TAppBar(title: Text('Reviews & Rating'), showBackArrow: true),

      //body
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rating and review section from people who already bought this product'),
                SizedBox(height: TSizes.spaceBtwItems),

                //overall rating
                TOverallProductRating(),
                TRatingBarIndicator(rating: 3.5),
                Text('123', style: Theme.of(context).textTheme.bodySmall),
                SizedBox(height: TSizes.spaceBtwSections),
                UserReviewsCard(),
                UserReviewsCard(),
                UserReviewsCard(),
              ],
            ),
          ),
      ),
    );
  }
}


