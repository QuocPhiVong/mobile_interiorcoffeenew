import 'package:flutter/material.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/device/device_utility.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({ 
    super.key, 
    required this.tabs 
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunction.isDarkMode(context);
    
    return Material(
      color: dark ? TColors.dark : TColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        tabAlignment: TabAlignment.center,
        indicatorColor: TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
        labelColor: dark ? TColors.white : TColors.primary,
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}