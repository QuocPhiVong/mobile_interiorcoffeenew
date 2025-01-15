import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/dialog/loading_dialog.dart';
import 'package:interior_coffee/data/repositories/transaction_repository.dart';

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
      required Function(String) onCreateVnPay}) async {
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
      onCreateVnPay(res['url']);
    }
    hideLoading();
  }
}
