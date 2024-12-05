import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/features/shop/screens/cart/widget/cart_items.dart';
import 'package:interior_coffee/features/shop/screens/checkout/checkout.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItems(),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(onPressed: () => Get.to(()=> CheckoutScreen()), child: Text('Checkout 899.000 VND'))),
    );
  }
}

