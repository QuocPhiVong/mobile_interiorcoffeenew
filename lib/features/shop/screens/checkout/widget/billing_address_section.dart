import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/text/section_heading.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Address', buttonTitle: 'Change',onPressed: (){}),
        Text('Username1', style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey, size: 16),
            SizedBox(width: TSizes.spaceBtwItems),
            Text('0982912617',style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 16),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: Text('District 12, Ho Chi Minh City', style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
          ],
        )
      ],
    );
  }
}
