import 'package:flutter/material.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key, 
    required this.image, 
    required this.title, 
    this.textColor = Colors.white, 
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap; 

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            //icon
            Container(
              width: 56,
              height: 56,
              padding: EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? TColors.dark : TColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(image: AssetImage(image), fit: BoxFit.cover, color: dark ? TColors.light : TColors.dark),
              ),
            ),
        
            //text label 
            SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55, 
              child: Text(
                title, 
                style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
            ),
            ),
          ],
        ),
      ),
    );
  }
}