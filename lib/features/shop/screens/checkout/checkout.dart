import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:interior_coffee/common/widgets/dialog/loading_dialog.dart';
import 'package:interior_coffee/common/widgets/success_screen/success_screen.dart';
import 'package:interior_coffee/data/response/products_response.dart';
import 'package:interior_coffee/features/shop/controllers/order_controller.dart';
import 'package:interior_coffee/features/shop/controllers/transaction_controller.dart';
import 'package:interior_coffee/features/shop/screens/cart/widget/cart_items.dart';
import 'package:interior_coffee/features/shop/screens/checkout/widget/billing_address_section.dart';
import 'package:interior_coffee/features/shop/screens/checkout/widget/billing_amount_section.dart';
import 'package:interior_coffee/features/shop/screens/checkout/widget/billing_payment_section.dart';
import 'package:interior_coffee/navigation_menu.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  OrderController _orderController = OrderController.instance;
  TransactionController _transactionController = TransactionController.instance;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Order Confirmation',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TCartItems(showAddRemoveButton: false),
              SizedBox(height: TSizes.spaceBtwSections),

              //billing
              TRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    TBillingAmountSection(),
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
              child: Text('Checkout 899.000 VND'))),
    );
  }

  Future<void> _onPayment() async {
    showLoading();
    final id = await _orderController.createOrder(
        vat: 0.1,
        feeAmount: 299,
        totalAmount: 899000,
        shippingAddress: 'TP. HCM',
        orderProducts: [
          Product(
              id: '1',
              name: 'White coffee arm chair',
              description: 'White coffee arm chair',
              sellingPrice: 399000,
              quantity: 1,
              merchantId: '1',
              categoryIds: [],
              images: null,
              discount: null,
              truePrice: null,
              status: 'available',
              dimensions: '40x40x90',
              materials: ['wood'],
              modelTextureUrl: 'https://example.com/texture.png',
              createdDate: DateTime.now(),
              updatedDate: DateTime.now(),
              campaignId: 'campaign123'),
          Product(
              id: '1',
              name: 'White coffee arm chair',
              description: 'White coffee arm chair',
              sellingPrice: 500000,
              quantity: 1,
              merchantId: '1',
              categoryIds: [],
              images: null,
              discount: null,
              truePrice: null,
              status: 'available',
              dimensions: '40x40x90',
              materials: ['wood'],
              modelTextureUrl: 'https://example.com/texture.png',
              createdDate: DateTime.now(),
              updatedDate: DateTime.now(),
              campaignId: 'campaign123'),
        ],
        voucherId: '',
        accountId: '123');
    await _transactionController.onCreateVnPay(
        accountId: '123',
        orderId: id ?? '',
        fullName: 'Quoc Phi Chuong',
        description: '',
        totalAmount: 899000,
        paymentMethod: '',
        currency: 'VND',
        onPaymentSuccess: () {
          Get.to(
            () => SuccessScreen(
                image: TImages.successfulIcon,
                title: 'Payment Success',
                subTitle: 'Your product will be shipped soon',
                onPressed: () => Get.offAll(() => NavigationMenu())),
          );
        });
  }
}
