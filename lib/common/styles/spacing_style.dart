import 'package:flutter/widgets.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

class TSpacingStyle{
  static EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: TSizes.appBarHeight,
    left: TSizes.defaultSpace,
    bottom: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
  );
}