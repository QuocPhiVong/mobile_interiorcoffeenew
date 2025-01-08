import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:interior_coffee/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  //Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  //update trang hien tai khi scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //chon page de navigate
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  //update trang hien tai va scroll den trang tiep
  void nextPage() {
    print(currentPageIndex.value);
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      storage.write('IsFirstTime', false);
      Get.offAll(() => LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(page, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  //update trang hien tai va scroll den trang cuoi
  void skipPage() {
    Get.offAll(() => LoginScreen());
  }
}
