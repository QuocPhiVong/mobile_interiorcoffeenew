import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/common/widgets/appbar/tabbar.dart';
import 'package:interior_coffee/common/widgets/brands/brand_card.dart';
import 'package:interior_coffee/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:interior_coffee/common/widgets/layout/grid_layout.dart';
import 'package:interior_coffee/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:interior_coffee/common/widgets/text/section_heading.dart';
import 'package:interior_coffee/features/shop/screens/merchant/all_merchant.dart';
import 'package:interior_coffee/features/shop/screens/store/widgets/category_tab.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounterIcon(onPressed: (){}, iconColor: THelperFunction.isDarkMode(context) ? TColors.white : TColors.black),
          ],
        ),
        body: NestedScrollView(headerSliverBuilder: (_, innerBoxIsScrolled){
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: THelperFunction.isDarkMode(context) ? TColors.dark : TColors.white,
              expandedHeight: 440,
      
              flexibleSpace: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    //Search bar
                    SizedBox(height: TSizes.spaceBtwItems),
                    TSearchContainer(text: 'Search in store', showBorder: true, showBackground: false),
                    SizedBox(height: TSizes.spaceBtwSections),
      
                    //featured merchant
                    TSectionHeading(title: 'Featured Merchants', onPressed: ()=> Get.to(()=> AllBrandsScreen())),
                    SizedBox(height: TSizes.spaceBtwItems / 1.5),

                    //merchant grid
                    TGridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, index){
                      return TBrandCard(showBorder: true);
                    })
                  ],
                ),
              ),

              //tab bar
              bottom: TTabBar(
                tabs: [
                  Tab(child: Text('Armchair')),
                  Tab(child: Text('Sofa')),
                  Tab(child: Text('Table')),
                  Tab(child: Text('Chair')),
                ],
              ),
            ),
          ];
        }, 
        body: TabBarView(
          children: [
            TCategoryTab(),
            TCategoryTab(),
            TCategoryTab(),
            TCategoryTab(),
          ]
        )
        )
      ),
    );
  }
}


