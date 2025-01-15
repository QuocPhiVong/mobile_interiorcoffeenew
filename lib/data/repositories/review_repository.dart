import 'package:get/get.dart';
import 'package:interior_coffee/data/dio/api_service.dart';

class ReviewRepository extends GetxController {
  static ReviewRepository get instance => Get.find();

  final ApiService _apiService = ApiService();

  Future<String> createReview({
    required String cmt,
    required int rate,
    required List<String> productId,
    required String accountId,
  }) async {
    try {
      final response = await _apiService.dio.post('/v1/reviews', data: {
        "comment": cmt,
        "rating": rate,
        "product-ids": productId,
        "account-id": accountId,
      });
      return response.data;
    } catch (e) {
      return '';
    }
  }

  Future<List> getReview(String productId) async {
    try {
      final response = await _apiService.dio.get('/v1/products/$productId/reviews');
      return response.data;
    } catch (e) {
      return [];
    }
  }
}
