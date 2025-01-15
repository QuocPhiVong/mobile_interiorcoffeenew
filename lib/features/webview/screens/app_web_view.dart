import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/success_screen/success_screen.dart';
import 'package:interior_coffee/features/authentication/controllers/auth_controller.dart';
import 'package:interior_coffee/features/shop/controllers/cart_controller.dart';
import 'package:interior_coffee/navigation_menu.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebView extends StatefulWidget {
  final String url;
  final String title;
  const AppWebView({super.key, required this.url, required this.title});

  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.endsWith('confirmation/success')) {
              Get.back();
              Get.to(
                () => SuccessScreen(
                    image: TImages.successfulIcon,
                    title: 'Payment Success',
                    subTitle: 'Your product will be shipped soon',
                    onPressed: () => Get.offAll(() => NavigationMenu())),
              );
              CartController.instance.clearCart(AuthController.instance.userData.value.email ?? '');
            }

            if (request.url.endsWith('confirmation/fail')) {
              Get.back();
              Get.to(
                () => SuccessScreen(
                    image: TImages.successfulIcon,
                    title: 'Payment Fail',
                    subTitle: 'Please try again',
                    onPressed: () => Get.offAll(() => NavigationMenu())),
              );
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true),
      body: WebViewWidget(controller: controller),
    );
  }
}
