import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/products/cart/add_remove_button.dart';
import 'package:interior_coffee/common/widgets/products/cart/cart_item.dart';
import 'package:interior_coffee/features/shop/screens/product_details/widget/product_price_text.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          TCartItem(),
          if(showAddRemoveButton) SizedBox(height: TSizes.spaceBtwItems),
          if(showAddRemoveButton)
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 110),
                  TProductQuantityWithControl(),
                ],
              ),

              TProductPriceText(price: '899.000'),
            ],
          )
        ],
      ),
    );
  }
}
