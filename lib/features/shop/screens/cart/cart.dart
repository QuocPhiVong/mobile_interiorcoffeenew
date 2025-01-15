import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/features/authentication/controllers/auth_controller.dart';
import 'package:interior_coffee/features/shop/controllers/cart_controller.dart';
import 'package:interior_coffee/features/shop/screens/cart/widget/cart_items.dart';
import 'package:interior_coffee/features/shop/screens/checkout/checkout.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/formatters/formatter.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController _cartController = CartController.instance;
  AuthController _authController = AuthController.instance;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cartController.getAllByEmail(_authController.userData.value.email ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.decimalPattern('vi_VN');

    return Scaffold(
      appBar: TAppBar(title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Obx(
          () => TCartItems(
            products: _cartController.products.value,
            onChanged: (int quantity, String id) {
              _cartController.updateData(id, quantity);
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
              onPressed: () {
                if (_cartController.products.isNotEmpty) {
                  Get.to(() => CheckoutScreen());
                  return;
                }
              },
              child: Obx(
                      () => Text('Checkout ${formatter.format(_cartController.totalPrice.value)}đ')
              ))),
    );
  }
}
