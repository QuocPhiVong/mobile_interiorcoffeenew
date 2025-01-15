import 'package:flutter/material.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class OrderCustomerInfoWidget extends StatelessWidget {
  final String name;
  final String address;
  const OrderCustomerInfoWidget({super.key, required this.name, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: TColors.grey),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Customer Info :',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: TSizes.spaceBtwItems),

          Text('Name: $name',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              )),
          Text('Address: $address',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              )),
        ],
      ),
    );
  }
}
