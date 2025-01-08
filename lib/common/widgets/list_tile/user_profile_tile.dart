import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_coffee/common/widgets/image/t_circular_image.dart';
import 'package:interior_coffee/features/authentication/controllers/auth_controller.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';

class TUserProfileTiles extends StatelessWidget {
  const TUserProfileTiles({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final info = AuthController.instance.userData;
    return ListTile(
      leading: TCircularImage(
        image: TImages.google,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Obx(() => Text(info.value.userName ?? '',
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white))),
      subtitle: Obx(() =>
          Text(info.value.email ?? '', style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white))),
      trailing: IconButton(onPressed: onPressed, icon: Icon(Iconsax.edit, color: TColors.white)),
    );
  }
}
