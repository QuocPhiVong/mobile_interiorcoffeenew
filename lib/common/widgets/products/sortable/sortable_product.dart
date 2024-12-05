import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_coffee/common/widgets/layout/grid_layout.dart';
import 'package:interior_coffee/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class TSortableProduct extends StatelessWidget {
  const TSortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Dropdown
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value){},
          items: ['Name', 'Price Ascending', 'Price Descending', 'Newest', 'Popular', 'Sale']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        SizedBox(height: TSizes.spaceBtwSections),
        ///Products
        TGridLayout(itemCount: 8, itemBuilder: (_, index) => TProductCardVertical())
      ],
    );
  }
}
