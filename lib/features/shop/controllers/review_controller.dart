import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/dialog/loading_dialog.dart';
import 'package:interior_coffee/data/repositories/review_repository.dart';
import 'package:interior_coffee/data/response/review_response.dart';

class ReviewController extends GetxController {
  static ReviewController get instance => Get.find();

  RxList<Review> reviews = <Review>[].obs;

  Future<void> onCreate({
    required String cmt,
    required int rate,
    required List<String> productId,
    required String accountId,
    required VoidCallback onSuccess,
  }) async {
    showLoading();
    final res =
        await ReviewRepository.instance.createReview(cmt: cmt, rate: rate, productId: productId, accountId: accountId);
    if (res == 'Action success') {
      onSuccess.call();
    }
    hideLoading();
  }

  Future<void> getReview(String productId) async {
    showLoading();
    final res = await ReviewRepository.instance.getReview(productId);
    reviews.value = (res).map((e) => Review.fromJson(e)).toList();
    hideLoading();
  }
}
