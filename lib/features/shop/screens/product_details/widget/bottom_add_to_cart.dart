import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_coffee/common/widgets/icon/circular_icon.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class TBottomAddToCart extends StatelessWidget {
  final Function(int) onAddToCart;
  final int maxQuantity;
  TBottomAddToCart({super.key, required this.onAddToCart, required this.maxQuantity});

  final RxInt quantity = 1.obs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (quantity.value > 1) {
                    quantity.value--;
                  }
                },
                child: Obx(
                  () => TCircularIcon(
                    icon: Iconsax.minus,
                    backgroundColor: (quantity.value) > 1 ? TColors.black : TColors.darkGrey,
                    width: 40,
                    height: 40,
                    color: TColors.white,
                  ),
                ),
              ),
              SizedBox(width: TSizes.spaceBtwItems),
              Obx(() => Text(quantity.value.toString(), style: Theme.of(context).textTheme.titleSmall)),
              SizedBox(width: TSizes.spaceBtwItems),
              GestureDetector(
                onTap: () {
                  if (quantity.value < maxQuantity) {
                    quantity.value++;
                  }
                },
                child: TCircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: TColors.black,
                  width: 40,
                  height: 40,
                  color: TColors.white,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              onAddToCart.call(quantity.value);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: BorderSide(color: TColors.black),
            ),
            child: Text('Add to cart'),
          )
        ],
      ),
    );
  }
}
