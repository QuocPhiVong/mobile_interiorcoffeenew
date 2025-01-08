import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/common/widgets/products/sortable/sortable_product.dart';
import 'package:interior_coffee/features/shop/screens/merchant/merchant_card.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class MerchantProduct extends StatelessWidget {
  const MerchantProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Zinus'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TMerchantCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections),

              TSortableProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
