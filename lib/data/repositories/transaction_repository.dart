import 'package:get/get.dart';
import 'package:interior_coffee/data/dio/api_service.dart';

class TransactionRepository extends GetxController {
  static TransactionRepository get instance => Get.find();

  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>?> onCreateVnPay({
    required String accountId,
    required String orderId,
    required String fullName,
    required String description,
    required double totalAmount,
    required String paymentMethod,
    required String currency,
  }) async {
    try {
      final response = await _apiService.dio.post('/v1/transactions/vnpay', data: {
        "account-id": accountId,
        "order-id": orderId,
        "full-name": fullName,
        "description": description,
        "total-amount": totalAmount,
        "payment-method": paymentMethod,
        "currency": currency,
      });
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
