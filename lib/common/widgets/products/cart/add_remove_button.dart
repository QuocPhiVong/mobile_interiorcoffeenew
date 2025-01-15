import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_coffee/common/widgets/icon/circular_icon.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class TProductQuantityWithControl extends StatefulWidget {
  final Function(int) onChanged;
  final int quantity;

  TProductQuantityWithControl({
    super.key,
    required this.quantity,
    required this.onChanged,
  });

  @override
  State<TProductQuantityWithControl> createState() => _TProductQuantityWithControlState();
}

class _TProductQuantityWithControlState extends State<TProductQuantityWithControl> {
  RxInt _quantity = 0.obs;
  @override
  void initState() {
    _quantity.value = widget.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            if (_quantity.value > 0) {
              _quantity.value--;
              widget.onChanged(_quantity.value);
            }
          },
          child: TCircularIcon(
            icon: Iconsax.minus,
            width: 32,
            height: 32,
            size: TSizes.md,
            color: THelperFunction.isDarkMode(context) ? TColors.white : TColors.black,
            backgroundColor: THelperFunction.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
          ),
        ),
        SizedBox(width: TSizes.spaceBtwItems),
        Obx(() {
          return Text('${_quantity.value}', style: Theme.of(context).textTheme.titleSmall);
        }),
        SizedBox(width: TSizes.spaceBtwItems),
        GestureDetector(
          onTap: () {
            _quantity.value++;
            widget.onChanged(_quantity.value);
          },
          child: TCircularIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: TSizes.md,
            color: TColors.white,
            backgroundColor: TColors.primary,
          ),
        ),
      ],
    );
  }
}
