import 'package:get/get.dart';
import 'package:interior_coffee/data/dio/api_service.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>?> getOrders(String customerId) async {
    try {
      final response = await _apiService.dio.get('/v1/orders/customer/$customerId');
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> createOrder({
    required double vat,
    required double feeAmount,
    required double totalAmount,
    required String shippingAddress,
    required List<Map<String, dynamic>> orderProducts,
    required String voucherId,
    required String accountId,
  }) async {
    try {
      final response = await _apiService.dio.post('/v1/orders', data: {
        "vat": vat,
        "fee-amount": feeAmount,
        "total-amount": totalAmount,
        "shipping-address": shippingAddress,
        "order-products": orderProducts,
        "voucher-id": voucherId,
        "account-id": accountId,
      });
      return response.data;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getOrderDetail(String orderId) async {
    try {
      final response = await _apiService.dio.get('/v1/orders/$orderId');
      return response.data;
    } catch (e) {
      return null;
    }
  }

  Future<void> updateOrderStatus(String orderId, String status) async {
    try {
      await _apiService.dio.patch('/v1/orders/$orderId',
          data: {"status": status, "updated-date": DateTime.now().toIso8601String(), "system-income": 0});
    } catch (e) {}
  }
}
