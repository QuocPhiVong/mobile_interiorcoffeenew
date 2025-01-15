import 'package:flutter/material.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  final int price;
  const TBillingAmountSection({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //subtotal
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
        //     Text('$price VND', style: Theme.of(context).textTheme.bodyMedium),
        //   ],
        // ),
        // SizedBox(height: TSizes.spaceBtwItems / 2),

        // //shipping fee
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
        //     Text('60.000 VND', style: Theme.of(context).textTheme.labelLarge),
        //   ],
        // ),
        // SizedBox(height: TSizes.spaceBtwItems / 2),

        // //VAT
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text('VAT', style: Theme.of(context).textTheme.bodyMedium),
        //     Text('60.000 VND', style: Theme.of(context).textTheme.labelLarge),
        //   ],
        // ),
        // SizedBox(height: TSizes.spaceBtwItems / 2),

        //Order total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('60.000 VND', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 10),
      ],
    );
  }
}
