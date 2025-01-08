import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:interior_coffee/app.dart';
import 'package:interior_coffee/data/repositories/authentication_repository.dart';
import 'package:interior_coffee/data/repositories/order_repository.dart';
import 'package:interior_coffee/data/repositories/product_repository.dart';
import 'package:interior_coffee/data/repositories/transaction_repository.dart';
import 'package:interior_coffee/features/authentication/controllers/auth_controller.dart';
import 'package:interior_coffee/features/shop/controllers/home_controller.dart';
import 'package:interior_coffee/features/shop/controllers/order_controller.dart';
import 'package:interior_coffee/features/shop/controllers/transaction_controller.dart';
import 'package:interior_coffee/navigation_menu.dart';

import 'firebase_options.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) {
      Get.put(AuthenticationRepository());
      Get.put(ProductRepository());
      Get.put(OrderRepository());
      Get.put(TransactionRepository());
      Get.put(NavigationController());
      Get.put(AuthController());
      Get.put(HomeController());
      Get.put(OrderController());
      Get.put(TransactionController());
    },
  );

  runApp(const App());
}
