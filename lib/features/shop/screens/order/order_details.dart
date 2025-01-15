import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/common/widgets/dialog/loading_dialog.dart';
import 'package:interior_coffee/features/authentication/controllers/auth_controller.dart';
import 'package:interior_coffee/features/shop/controllers/order_controller.dart';
import 'package:interior_coffee/features/shop/controllers/review_controller.dart';
import 'package:interior_coffee/features/shop/screens/order/widget/order_confirm_dialog.dart';
import 'package:interior_coffee/features/shop/screens/order/widget/order_customer_info.dart';
import 'package:interior_coffee/features/shop/screens/order/widget/order_products.dart';
import 'package:interior_coffee/features/shop/screens/order/widget/order_review_dialog.dart';
import 'package:interior_coffee/features/shop/screens/order/widget/order_status.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:intl/intl.dart';

class OrderDetails extends StatefulWidget {
  final String orderId;
  const OrderDetails({super.key, required this.orderId});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await OrderController.instance.getOrderDetail(widget.orderId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            children: [
              Obx(() {
                return OrderStatusWidget(
                  status: OrderController.instance.selectedOrder.value?.status ?? '',
                  orderId: OrderController.instance.selectedOrder.value?.id ?? '',
                  placedOn: DateFormat('dd/MM/yyyy hh:mm a')
                      .format(OrderController.instance.selectedOrder.value?.orderDate ?? DateTime.now())
                      .toString(),
                );
              }),
              SizedBox(height: 16),
              Obx(() {
                return OrderCustomerInfoWidget(
                  name: AuthController.instance.userData.value.userName ?? '',
                  address: OrderController.instance.selectedOrder.value?.shippingAddress ?? '',
                );
              }),
              SizedBox(height: 16),
              Obx(() => OrderProductsWidget(
                products: OrderController.instance.selectedOrder.value?.orderProducts ?? [],
                totalPrice: OrderController.instance.selectedOrder.value?.totalAmount ?? 0,
              )),
            ],
          )),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
              onPressed: () async {
                switch (OrderController.instance.selectedOrder.value!.status?.toLowerCase()) {
                  case 'shipped':
                    Get.dialog(OrderConfirmDialog(
                      onConfirm: () async {
                        showLoading();
                        await OrderController.instance.updateOrderStatus(widget.orderId, 'completed');
                        await OrderController.instance.getOrderDetail(widget.orderId);
                        hideLoading();
                      },
                    ));

                  case 'completed':
                    _showReviewDialog();
                  default:
                }
              },
              child: Obx(() => Text((OrderController.instance.selectedOrder.value?.status?.toLowerCase() == 'completed')
                  ? 'Review'
                  : 'Finish Order')))),
    );
  }

  void _showReviewDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ReviewDialog(
          onReviewSubmitted: (int rate, String cmt) async {
            showLoading();
            await ReviewController.instance.onCreate(
                cmt: cmt,
                rate: rate,
                productId: OrderController.instance.selectedOrder.value!.orderProducts
                    ?.map((product) => product.id ?? '')
                    .toList() ??
                    [],
                accountId: AuthController.instance.userData.value.id ?? '',
                onSuccess: () {
                  hideLoading();
                  showSnackbar('Success', 'Review submitted successfully');
                });
          },
        ),
      ),
    );
  }
}
