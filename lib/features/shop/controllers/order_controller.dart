import 'package:get/get.dart';
import 'package:interior_coffee/data/repositories/order_repository.dart';
import 'package:interior_coffee/data/response/order_response.dart';
import 'package:interior_coffee/data/response/products_response.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final RxBool isOrdersLoading = false.obs;

  final RxList<Order> orders = RxList.empty();

  Future<void> onFetchOrders() async {
    isOrdersLoading.value = true;
    final response = await OrderRepository.instance.getOrders();
    if (response != null) {
      orders.value = OrderResponse.fromJson(response).items ?? [];
    }
    isOrdersLoading.value = false;
    update();
  }

  Future<String?> createOrder(
      {required double vat,
      required double feeAmount,
      required double totalAmount,
      required String shippingAddress,
      required List<Product> orderProducts,
      required String voucherId,
      required String accountId}) async {
    final response = await OrderRepository.instance.createOrder(
      vat: vat,
      feeAmount: feeAmount,
      totalAmount: totalAmount,
      shippingAddress: shippingAddress,
      orderProducts: orderProducts
          .map((product) => {
                "_id": product.id,
                "name": product.name,
                "description": product.description,
                "price": product.sellingPrice,
                "quantity": product.quantity,
                "merchant-id": product.merchantId
              })
          .toList(),
      voucherId: voucherId,
      accountId: accountId,
    );
    if (response != null) {
      return response;
    }
    return null;
  }
}
