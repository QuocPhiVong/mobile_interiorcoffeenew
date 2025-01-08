import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/dialog/loading_dialog.dart';
import 'package:interior_coffee/data/repositories/transaction_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class TransactionController extends GetxController {
  static TransactionController get instance => Get.find();

  Future<void> onCreateVnPay(
      {required String accountId,
      required String orderId,
      required String fullName,
      required String description,
      required double totalAmount,
      required String paymentMethod,
      required String currency,
      required VoidCallback onPaymentSuccess}) async {
    final res = await TransactionRepository.instance.onCreateVnPay(
        accountId: accountId,
        orderId: orderId,
        fullName: fullName,
        description: description,
        totalAmount: totalAmount,
        paymentMethod: paymentMethod,
        currency: currency);
    if (res != null) {
      hideLoading();

      await launchUrl(Uri.parse(res['url']), mode: LaunchMode.inAppWebView);
      //TODO: Handle the response from the VnPay
      onPaymentSuccess.call();
    }
    hideLoading();
  }
}
