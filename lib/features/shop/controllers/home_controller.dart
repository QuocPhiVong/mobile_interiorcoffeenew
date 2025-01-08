import 'package:get/get.dart';
import 'package:interior_coffee/data/repositories/product_repository.dart';
import 'package:interior_coffee/data/response/products_response.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final carouselCurrentIndex = 0.obs;

  final RxBool isProductsLoading = false.obs;

  final RxBool isProductLoading = false.obs;

  final Rx<Product> selectedProduct = Product(
          id: null,
          categoryIds: null,
          name: '',
          description: '',
          images: null,
          sellingPrice: 0,
          discount: 0,
          truePrice: 0,
          quantity: 0,
          status: '',
          dimensions: '',
          materials: [],
          modelTextureUrl: '',
          createdDate: DateTime.now(),
          updatedDate: DateTime.now(),
          campaignId: '',
          merchantId: '')
      .obs;

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  RxList<Product> products = RxList.empty();

  Future<void> fetchProducts() async {
    isProductsLoading.value = true;
    products.value = [];
    final response = await ProductRepository.instance.getProducts();
    if (response != null) {
      products.value = ProductsResponse.fromJson(response).products ?? [];
    }
    isProductsLoading.value = false;
    // update();
  }

  Future<void> fetchProduct(String productId) async {
    isProductLoading.value = true;
    final response = await ProductRepository.instance.getProduct(productId);
    if (response != null) {
      selectedProduct.value = Product.fromJson(response);
    }
    isProductLoading.value = false;
    // update();
  }
}
