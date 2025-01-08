import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/features/authentication/controllers/auth_controller.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = "https://interior-coffee-api-f2d9dqd2eyccesfq.southeastasia-01.azurewebsites.net/api";
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.options.headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('--- Dio Request ---');
        print('URI: ${options.uri}');
        print('Method: ${options.method}');
        print('Headers: ${options.headers}');
        print('Data: ${options.data}');
        final token = Get.find<AuthController>().token;
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        if (error.response?.statusCode == 400) {
          AuthController.instance.logout();
        }
        return handler.next(error);
      },
    ));
  }

  Dio get dio => _dio;
}
