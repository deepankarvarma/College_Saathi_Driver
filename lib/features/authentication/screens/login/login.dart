import 'package:college_saathi/common/styles/spacing_styles.dart';
import 'package:college_saathi/features/authentication/controllers/login/login_controller.dart';
import 'package:college_saathi/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:college_saathi/features/authentication/screens/signup/signup.dart';
import 'package:college_saathi/navigation_menu.dart';
import 'package:college_saathi/utils/constants/colors.dart';
import 'package:college_saathi/utils/constants/image_strings.dart';
import 'package:college_saathi/utils/constants/sizes.dart';
import 'package:college_saathi/utils/constants/text_strings.dart';
import 'package:college_saathi/utils/helpers/helper_functions.dart';
import 'package:college_saathi/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title and sub-title
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(height: 150, image: AssetImage(dark ? TImages.lightAppLogo:TImages.darkAppLogo)),
                  Text(TTexts.loginTitle,style: Theme.of(context).textTheme.headlineMedium,),
                  const SizedBox(height: TSizes.sm),
                  Text(TTexts.loginSubTitle,style: Theme.of(context).textTheme.bodyMedium,)
                ],
              ),
              //Form
              Form(key: controller.loginFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
                child: Column(
                  children: [
                    // Email
                    TextFormField(
                      controller: controller.email,
                      validator: (value)=> TValidator.validateEmail(value),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: TTexts.email,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    // Password
                    Obx(
                      ()=> TextFormField(
                        controller: controller.password,
                        validator: (value) => TValidator.validatePassword(value),
                        obscureText: controller.hidePassword.value,
                        decoration:  InputDecoration(
                          prefixIcon: const Icon(Iconsax.password_check),
                          labelText: TTexts.password,
                          suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value=!controller.hidePassword.value,
                            icon:  Icon(controller.hidePassword.value? Iconsax.eye_slash:Iconsax.eye),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields/2),
                
                    //Remember Me and Forgot Password
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Remember me
                        Row(
                          children: [
                            
                          Obx(()=> Checkbox(value: controller.rememberMe.value,onChanged: (value) => controller.rememberMe.value=!controller.rememberMe.value)),

                          const Text(TTexts.rememberMe),
                          ],
                        ),
                        // Forgot Password
                        TextButton(onPressed: ()=> Get.to(() => const ForgetPassword()), child: const Text(TTexts.forgetPassword))
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    // Sign In Button
                    SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>Get.to(()=> controller.emailAndPasswordSignIn()), child: const Text(TTexts.signIn))),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    // Create Account Button
                    SizedBox(width: double.infinity,child: OutlinedButton(onPressed: ()=>Get.to(()=>const SignupScreen()), child: const Text(TTexts.createAccount)))
                    
                  ],
                ),
              )
              ),

              // Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Flexible(child: Divider(color: dark?TColors.darkGrey:TColors.grey,thickness: 0.5, indent: 60,endIndent: 5,)),
                Text(TTexts.orSignInWith.capitalize!,style: Theme.of(context).textTheme.labelMedium,),
                Flexible(child: Divider(color: dark?TColors.darkGrey:TColors.grey,thickness: 0.5, indent: 5,endIndent: 60,)),
                ],
              ),
            const SizedBox(height: TSizes.spaceBtwSections,),
              // Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all(color: TColors.grey),borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                    onPressed: (){},
                    icon: const Image(
                      width: TSizes.iconMd,
                      height: TSizes.iconMd,
                      image: AssetImage(TImages.google),
                    )
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: TColors.grey),borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                    onPressed: (){},
                    icon: const Image(
                      width: TSizes.iconMd,
                      height: TSizes.iconMd,
                      image: AssetImage(TImages.facebook),
                    )
                  ),
                ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}
