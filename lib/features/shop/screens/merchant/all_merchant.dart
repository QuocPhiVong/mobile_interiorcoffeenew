import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/common/widgets/layout/grid_layout.dart';
import 'package:interior_coffee/common/widgets/text/section_heading.dart';
import 'package:interior_coffee/features/shop/screens/merchant/merchant_card.dart';
import 'package:interior_coffee/features/shop/screens/merchant/merchant_product.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Merchant'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Heading
              TSectionHeading(title: 'Merchants', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems),

              ///brands
              TGridLayout(itemCount: 10,mainAxisExtent: 80,
                  itemBuilder: (context, index) =>
                      TMerchantCard(showBorder: true, onTap: () => Get.to(() => MerchantProduct()))),
            ],
          ),
        ),
      ),
    );
  }}