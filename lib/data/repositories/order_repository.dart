import 'package:get/get.dart';
import 'package:interior_coffee/data/dio/api_service.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>?> getOrders() async {
    try {
      final response = await _apiService.dio.get('/v1/orders');
      return response.data;
    } catch (e) {
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
}
