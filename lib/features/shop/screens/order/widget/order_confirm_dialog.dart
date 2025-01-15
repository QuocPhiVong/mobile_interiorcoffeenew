import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderConfirmDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  const OrderConfirmDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Order Confirmation'),
        content: Text('Are you sure you received the order?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel'),
          ),
          TextButton(
              child: Text('ok'),
              onPressed: () {
                Get.back();
                onConfirm.call();
              })
        ]);
  }
}
