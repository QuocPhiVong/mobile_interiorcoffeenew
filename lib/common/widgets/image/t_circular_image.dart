import 'package:flutter/material.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';


class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key, 
    this.fit = BoxFit.cover, 
    required this.image, 
    this.isNetworkImage = false, 
    this.overlayColor, 
    this.backgroundColor, 
    this.width = 56, 
    this.height = 56, 
    this.padding = TSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        //if image background is null then switch backgroudn to dark and light design
        color: backgroundColor ?? (THelperFunction.isDarkMode(context) ? TColors.black : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
          color: overlayColor,
      ),
      ),
    );
  }
}