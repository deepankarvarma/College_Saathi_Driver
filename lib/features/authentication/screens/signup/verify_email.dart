import 'package:college_saathi/features/authentication/screens/login/login.dart';
import 'package:college_saathi/features/authentication/screens/signup/success_screen.dart';
import 'package:college_saathi/utils/constants/image_strings.dart';
import 'package:college_saathi/utils/constants/text_strings.dart';
import 'package:college_saathi/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:college_saathi/utils/constants/sizes.dart';

class VerifyEmailScreen extends StatelessWidget{
    const VerifyEmailScreen({super.key});
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
                actions: [
                    IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear)),
                ]
            ),
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: Column(
                        children: [
                            Image(
                              image: const AssetImage(TImages.deliveredEmailIllustration),
                              width: THelperFunctions.screenWidth()*0.6,
                            ),
                            const SizedBox(height: TSizes.spaceBtwSections,),
                            // Title and sub title
                            Text(TTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
                            const SizedBox(height: TSizes.spaceBtwItems,),
                            Text('support@email.com', style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
                            const SizedBox(height: TSizes.spaceBtwItems,),

                            Text(TTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
                            const SizedBox(height: TSizes.spaceBtwSections,),
                            // bUTTONS 
                            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=>Get.to(() => const SuccessScreen()), child: const Text(TTexts.tContinue))),
                            const SizedBox(height: TSizes.spaceBtwItems,),

                            SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text(TTexts.resendEmail))),

                        ],
                    ),
                ),
            ),
        );
    }
}



