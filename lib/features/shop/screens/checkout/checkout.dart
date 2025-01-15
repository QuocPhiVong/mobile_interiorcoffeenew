import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:interior_coffee/common/widgets/dialog/loading_dialog.dart';
import 'package:interior_coffee/data/response/products_response.dart';
import 'package:interior_coffee/features/authentication/controllers/auth_controller.dart';
import 'package:interior_coffee/features/shop/controllers/cart_controller.dart';
import 'package:interior_coffee/features/shop/controllers/order_controller.dart';
import 'package:interior_coffee/features/shop/controllers/transaction_controller.dart';
import 'package:interior_coffee/features/shop/screens/cart/widget/cart_items.dart';
import 'package:interior_coffee/features/shop/screens/checkout/widget/billing_address_section.dart';
import 'package:interior_coffee/features/shop/screens/checkout/widget/billing_amount_section.dart';
import 'package:interior_coffee/features/shop/screens/checkout/widget/billing_payment_section.dart';
import 'package:interior_coffee/features/webview/screens/app_web_view.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';
import 'package:intl/intl.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  OrderController _orderController = OrderController.instance;
  CartController _cartController = CartController.instance;
  TransactionController _transactionController = TransactionController.instance;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    var formatter = NumberFormat.decimalPattern('vi_VN');

    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true, title: Text('Order Confirmation', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                () => TCartItems(
                  showAddRemoveButton: false,
                  products: _cartController.products.value,
                  onChanged: (int quantity, String id) {
                    _cartController.updateData(id, quantity);
                  },
                ),
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              //billing
              TRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Order Total Price : ', style: Theme.of(context).textTheme.bodyMedium),
                        Obx(
                                () => Text('${formatter.format(_cartController.totalPrice.value)}đ', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
                        ),
                      ],
                    ),
                    SizedBox(height: TSizes.spaceBtwItems),

                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //Payment method
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //Address
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
              onPressed: () {
                _onPayment();
              },
              child: Obx(() => Text('Checkout ${formatter.format(_cartController.totalPrice.value)}đ')))),
    );
  }

  Future<void> _onPayment() async {
    showLoading();
    final id = await _orderController.createOrder(
      vat: 0.1,
      feeAmount: 299,
      totalAmount: double.parse(_cartController.totalPrice.value.toString()),
      shippingAddress: AuthController.instance.userData.value.address ?? '',
      orderProducts:
          _cartController.products.value.where((e) => e != null).map((e) => e.object?..quantity = e.quantity).toList(),
      voucherId: '',
      accountId: AuthController.instance.userData.value.id ?? '',
    );
    await _transactionController.onCreateVnPay(
        accountId: AuthController.instance.userData.value.id ?? '',
        orderId: id ?? '',
        fullName: AuthController.instance.userData.value.userName ?? '',
        description: '',
        totalAmount: double.parse(_cartController.totalPrice.value.toString()),
        paymentMethod: '',
        currency: 'VND',
        onCreateVnPay: (String url) {
          Get.to(() => AppWebView(
                url: url,
                title: 'VnPay',
              ));
        });
  }
}
