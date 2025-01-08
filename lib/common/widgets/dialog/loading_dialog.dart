import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoading() {
  if (!Get.isDialogOpen!) {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
  }
}

void hideLoading() {
  if (Get.isSnackbarOpen == true) {
    Get.closeAllSnackbars();
    Future.delayed(const Duration(milliseconds: 100), () {
      hideLoading();
    });
  } else if (Get.isDialogOpen == true) {
    Get.back();
    Future.delayed(const Duration(milliseconds: 100), () {
      hideLoading();
    });
  }
}

void showSnackbar(String title, String message) {
  Future.delayed(const Duration(milliseconds: 100), () {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
      duration: Duration(seconds: 3),
    );
  });
}
