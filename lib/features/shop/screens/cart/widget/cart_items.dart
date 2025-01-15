import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/products/cart/add_remove_button.dart';
import 'package:interior_coffee/common/widgets/products/cart/cart_item.dart';
import 'package:interior_coffee/data/response/products_response.dart';
import 'package:interior_coffee/features/shop/screens/product_details/widget/product_price_text.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:intl/intl.dart';

class TCartItems extends StatelessWidget {
  final List<CartItem> products;
  final Function(int quantity, String id) onChanged;
  const TCartItems({super.key, this.showAddRemoveButton = true, required this.products, required this.onChanged});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.decimalPattern('vi_VN');

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwSections),
      itemCount: products.length,
      itemBuilder: (_, index) => Column(
        children: [
          if (products[index].object != null) TCartItem(product: products[index].object),
          if (showAddRemoveButton) SizedBox(height: TSizes.spaceBtwItems),
          if (showAddRemoveButton)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 110),
                    TProductQuantityWithControl(
                      key: Key('${products[index].id ?? DateTime.now().microsecondsSinceEpoch.toString()}-control'),
                      quantity: products[index].quantity ?? 0,
                      onChanged: (int quantity) {
                        onChanged.call(quantity, products[index].id ?? '');
                      },
                    ),
                  ],
                ),
                TProductPriceText(
                    key: Key(products[index].id ?? DateTime.now().microsecondsSinceEpoch.toString()),
                    price: formatter.format(products[index].object?.sellingPrice ?? 0),)
              ],
            )
        ],
      ),
    );
  }
}
