import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/common/widgets/products/ratings/ratings_indicator.dart';
import 'package:interior_coffee/features/shop/controllers/review_controller.dart';
import 'package:interior_coffee/features/shop/screens/product_review/widget/rating_progress_indicator.dart';
import 'package:interior_coffee/features/shop/screens/product_review/widget/user_reviews_card.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatefulWidget {
  final String productId;
  const ProductReviewsScreen({super.key, required this.productId});

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends State<ProductReviewsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ReviewController.instance.getReview(widget.productId);
    });
    super.initState();
  }

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

              //overall ratinng
              Obx(() => Column(
                  children:
                      ReviewController.instance.reviews.map((review) => UserReviewsCard(review: review)).toList()))
            ],
          ),
        ),
      ),
    );
  }
}
