import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:interior_coffee/common/widgets/products/ratings/ratings_indicator.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';
import 'package:readmore/readmore.dart';

class UserReviewsCard extends StatelessWidget {
  const UserReviewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(TImages.google)),
                SizedBox(width: TSizes.spaceBtwItems),
                Text('Username1', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
          ],
        ),
        SizedBox(width: TSizes.spaceBtwItems),

        //Review content
        Row(
          children: [
            TRatingBarIndicator(rating: 4),
            SizedBox(width: TSizes.spaceBtwItems),
            Text('22 Nov, 2024', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        ReadMoreText(
            'This product is very very good and convinient, its also adaptive, match all of my color pallete for my coffee shop design',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' Show less',
          trimCollapsedText: 'Show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),
        SizedBox(height: TSizes.spaceBtwItems),


        //Merchant reply
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
              padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Merchant1', style: Theme.of(context).textTheme.titleMedium),
                    Text('23 Nov, 2024', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                ReadMoreText(
                  'Thank you for using our services, if there is any problems with the product, please contact us ASAP',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' Show less',
                  trimCollapsedText: 'Show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
