import 'package:flutter/material.dart';
import 'package:interior_coffee/utils/constants/colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final String orderId;
  final String placedOn;
  const OrderStatusWidget({
    super.key,
    required this.status,
    required this.orderId,
    required this.placedOn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                color: TColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Text('Status: $status',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ))),
          Container(
            decoration: BoxDecoration(
              color: TColors.grey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order ID: $orderId',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                SizedBox(height: 5),
                Text('Plced on: $placedOn',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
