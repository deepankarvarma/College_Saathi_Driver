import 'package:college_saathi/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:college_saathi/utils/constants/image_strings.dart';
import 'package:college_saathi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

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
                    // TCircularImage(image:TImages.user,width:80,height:80),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture'))
                  ],
                ),
              ),

              // Details
              const SizedBox(height: TSizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              // Heading Profile Info
              // const TSectionHeading(title:'Profile Information', showActionButton:false),
              const SizedBox(height: TSizes.spaceBtwItems,),
              TProfileMenu(title:'Name',value: 'Deepankar Varma',onPressed:(){}),
              TProfileMenu(title:'User Type',value: 'd_eepankar',onPressed:(){}),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),

              // Heading Personal Info
              // const TSectionHeading(title:'Personal Information', showActionButton:false),
              const SizedBox(height: TSizes.spaceBtwItems,),
              TProfileMenu(title:'User Id',value: 'Deepankar Varma',onPressed:(){}),
              TProfileMenu(title:'Email',value: 'd_eepankar',onPressed:(){}),
              TProfileMenu(title:'Phone Number',value: 'd_eepankar',onPressed:(){}),
              TProfileMenu(title:'Gender',value: 'd_eepankar',onPressed:(){}),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Center(
                child:TextButton(onPressed: (){}, 
                child: const Text('Close Account',style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
          ),
      ),
    );
  }
}

