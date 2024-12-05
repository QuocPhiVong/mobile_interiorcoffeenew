import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:interior_coffee/common/widgets/success_screen/success_screen.dart';
import 'package:interior_coffee/features/shop/screens/cart/widget/cart_items.dart';
import 'package:interior_coffee/features/shop/screens/checkout/widget/billing_address_section.dart';
import 'package:interior_coffee/features/shop/screens/checkout/widget/billing_amount_section.dart';
import 'package:interior_coffee/features/shop/screens/checkout/widget/billing_payment_section.dart';
import 'package:interior_coffee/navigation_menu.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Order Confirmation', style: Theme.of(context).textTheme.headlineSmall)),
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
          child: ElevatedButton(onPressed: () => Get.to(()=> SuccessScreen(
              image: TImages.successfulIcon,
              title: 'Payment Success',
              subTitle: 'Your product will be shipped soon',
              onPressed: () => Get.offAll(() => NavigationMenu())
          ),
          ),
              child: Text('Checkout 899.000 VND'))),
    );
  }
}
