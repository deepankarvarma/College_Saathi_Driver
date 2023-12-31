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

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: const TAppBar(title: Text('My Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(image:TImages.user,width:80,height:80),
                    TextButton(
                        onPressed: ()=>Get.off(()=> const LoginScreen()),
                        child: const Text('Log Out'))
                  ],
                ),
              ),

              // Details
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              // Heading Profile Info
              const TSectionHeading(title:'Profile Information', showActionButton:false),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              
              Obx(
                ()=> TProfileMenu(
                    title: 'Name', value: controller.user.value.fullName, onPressed: () => Get.to(()=>const changeName())),
              ),
              Obx(
                ()=>TProfileMenu(
                  title: 'User Name', value: controller.user.value.username, onPressed: () {}),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              // Heading Personal Info
              const TSectionHeading(title:'Personal Information', showActionButton:false),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Obx(
                ()=>TProfileMenu(
                  title: 'User Id', value: controller.user.value.id,icon: Iconsax.copy, onPressed: () {}),
              ),
              Obx(
                ()=>TProfileMenu(
                  title: 'Email',
                  value: controller.user.value.email,
                  onPressed: () {}),
              ),
              Obx(
                ()=>TProfileMenu(
                  title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: () {}),
              ),
              TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              const Divider(),
              const SizedBox( 
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Close Account',
                      style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
