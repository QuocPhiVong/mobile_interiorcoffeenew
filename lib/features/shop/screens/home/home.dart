import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:interior_coffee/common/widgets/layout/grid_layout.dart';
import 'package:interior_coffee/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:interior_coffee/common/widgets/text/section_heading.dart';
import 'package:interior_coffee/features/authentication/controllers/auth_controller.dart';
import 'package:interior_coffee/features/shop/controllers/cart_controller.dart';
import 'package:interior_coffee/features/shop/controllers/home_controller.dart';
import 'package:interior_coffee/features/shop/screens/all_products/all_products.dart';
import 'package:interior_coffee/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:interior_coffee/features/shop/screens/home/widgets/home_category.dart';
import 'package:interior_coffee/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:interior_coffee/features/shop/screens/store/store.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController _homeController = HomeController.instance;
  CartController _cartController = CartController.instance;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _homeController.fetchProducts();
      _cartController.getAllByEmail(AuthController.instance.userData.value.email ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  SizedBox(height: TSizes.spaceBtwSections),
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwItems),

/*                  //Search bar
                  TSearchContainer(
                    text: 'Search in store',
                  ),*/
/*                  SizedBox(height: TSizes.spaceBtwSections),

                  //categories slider
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(title: 'Furniture Types', showActionButton: false, textColor: Colors.white),
                        SizedBox(height: TSizes.spaceBtwItems),

                        //category
                        THomeCategory(),
                      ],
                    ),
                  ),*/

                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            //home body
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //promotion slider
                  TPromoSlider(banners: [TImages.promoBanner1, TImages.promoBanner2, TImages.promoBanner3]),
                  SizedBox(height: TSizes.spaceBtwSections),

                  //heading
                  TSectionHeading(title: 'Popular Product', onPressed: () => Get.to(() => StoreScreen())),
                  SizedBox(height: TSizes.spaceBtwItems),

                  //popular product
                  Obx(
                    () => (_homeController.isProductsLoading.value)
                        ? Center(child: CircularProgressIndicator())
                        : TGridLayout(
                            itemCount: _homeController.products.length,
                            itemBuilder: (_, index) => TProductCardVertical(
                              info: _homeController.products[index],
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
