import 'package:college_saathi/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:college_saathi/features/authentication/screens/login/login.dart';
import 'package:college_saathi/features/personalization/controllers/user_controller.dart';
import 'package:college_saathi/features/personalization/screens/profile/change_name.dart';
import 'package:college_saathi/features/personalization/screens/profile/section_heading.dart';
import 'package:college_saathi/features/personalization/screens/profile/t_circular_image.dart';
import 'package:college_saathi/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:college_saathi/tapp_bar.dart';
import 'package:college_saathi/utils/constants/image_strings.dart';
import 'package:college_saathi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class TAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TAppBar({
    super.key,
    this.title,
    this.actions,
    required this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = true,

  });
  final Widget? title;
  final bool showBackArrow;
  final IconData leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  @override
  Widget build(BuildContext context){

    return Padding( 
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow ? 
        IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left))
        // ignore: unnecessary_null_comparison
        : leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)): null,
        title: title,
        actions: actions,

      ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return Size.fromHeight(TDeviceUtils.getAppBarHeight());
  }
}

