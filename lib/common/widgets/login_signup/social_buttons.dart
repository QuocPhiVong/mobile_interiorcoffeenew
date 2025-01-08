import 'package:flutter/material.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';

import '../../../features/authentication/controllers/auth_controller.dart';

class TSocialButtons extends StatelessWidget {
  final AuthController _authController = AuthController.instance;

  TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () async => await _authController.loginWithGoogle(),
            icon: Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImages.google),
            ),
          ),
        )
      ],
    );
  }
}
