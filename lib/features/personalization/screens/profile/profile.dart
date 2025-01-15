import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/common/widgets/image/t_circular_image.dart';
import 'package:interior_coffee/common/widgets/text/section_heading.dart';
import 'package:interior_coffee/features/authentication/controllers/auth_controller.dart';
import 'package:interior_coffee/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final info = AuthController.instance.userData;
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('User Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TCircularImage(image: TImages.google, width: 80, height: 80),
                    //TextButton(onPressed: () {}, child: Text('Change profile picture')),
                  ],
                ),
              ),

              SizedBox(height: TSizes.spaceBtwItems / 2),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),
              TSectionHeading(title: 'Profile Information', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(onPressed: () {}, title: 'Name', value: info.value.userName ?? ''),
              Obx(() => TProfileMenu(onPressed: () {}, title: 'Username', value: info.value.userName ?? '')),

              SizedBox(height: TSizes.spaceBtwItems),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              //heading personal infomation
              TSectionHeading(title: 'Personal Information', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems),

              Obx(() => TProfileMenu(onPressed: () {}, title: 'Email', value: info.value.email ?? '')),
              Obx(() => TProfileMenu(onPressed: () {}, title: 'Phone number', value: info.value.phoneNumber ?? '')),
              TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              TProfileMenu(onPressed: () {}, title: 'DOB', value: '11/11/2002'),
              TProfileMenu(onPressed: () {}, title: 'Address', value: 'District 12, Ho Chi Minh City'),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(onPressed: () {}, child: Text('Log out', style: TextStyle(color: Colors.red))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
