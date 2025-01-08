import 'package:get/get.dart';
import 'package:interior_coffee/data/dio/api_service.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>?> getProducts() async {
    try {
      final response = await _apiService.dio.get('/v1/products');
      return response.data;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getProduct(String productId) async {
    try {
      final response = await _apiService.dio.get('/v1/products/$productId');
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
