import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/features/shop/screens/order/widget/order_list.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),

        //Order
        child: TOrderListItems(),
      ),
    );
  }
}
