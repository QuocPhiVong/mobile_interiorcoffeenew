import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/features/shop/controllers/order_controller.dart';
import 'package:interior_coffee/features/shop/screens/order/widget/order_list.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  OrderController _orderController = OrderController.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _orderController.onFetchOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        //Order
        child: Obx(() => (_orderController.isOrdersLoading.value)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : TOrderListItems(orders: _orderController.orders)),
      ),
    );
  }
}
