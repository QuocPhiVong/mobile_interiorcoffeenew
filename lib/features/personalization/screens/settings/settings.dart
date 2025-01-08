import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:interior_coffee/common/widgets/list_tile/setting_menu_tile.dart';
import 'package:interior_coffee/common/widgets/list_tile/user_profile_tile.dart';
import 'package:interior_coffee/common/widgets/text/section_heading.dart';
import 'package:interior_coffee/features/authentication/controllers/auth_controller.dart';
import 'package:interior_coffee/features/personalization/screens/profile/profile.dart';
import 'package:interior_coffee/features/shop/screens/cart/cart.dart';
import 'package:interior_coffee/features/shop/screens/order/order.dart';
import 'package:interior_coffee/features/shop/screens/wishlist/wishlist.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                TAppBar(
                    title: Text('Settings',
                        style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),
                SizedBox(height: TSizes.spaceBtwSections),

                //User profile card
                TUserProfileTiles(onPressed: () => Get.to(() => ProfileScreen())),
                SizedBox(height: TSizes.spaceBtwSections),
              ],
            )),

            //body
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //Account settings
                  TSectionHeading(title: 'Account Settings', showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Iconsax.heart,
                    title: 'My Favourite',
                    subTitle: 'View your favourite furnitures list',
                    onTap: () => Get.to(FavouriteScreen()),
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.shopping_bag,
                    title: 'My Cart',
                    subTitle: 'View your cart',
                    onTap: () => Get.to(() => CartScreen()),
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.bill,
                    title: 'My Orders',
                    subTitle: 'View your order and track order status',
                    onTap: () => Get.to(() => OrderScreen()),
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Unread notifications',
                    onTap: () {},
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.designtools,
                    title: 'My design template',
                    subTitle: 'View your template list',
                    onTap: () {},
                  ),

                  SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(title: 'Application Settings', showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Iconsax.paperclip,
                    title: 'Policy',
                    subTitle: 'View term and agreements',
                    onTap: () {},
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.logout,
                    title: 'Logout',
                    subTitle: 'Logout application',
                    onTap: () => AuthController.instance.logout(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
