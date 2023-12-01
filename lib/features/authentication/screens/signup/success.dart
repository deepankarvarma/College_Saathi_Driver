import 'package:college_saathi/common/styles/spacing_styles.dart';
import 'package:college_saathi/utils/constants/sizes.dart';
import 'package:college_saathi/utils/constants/text_strings.dart';
import 'package:college_saathi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class Success_Screen extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final Function onPressed;

  const Success_Screen({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),
              // Title and sub title
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              // BUTTON
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text(TTexts.tContinue))),
              const SizedBox(height: TSizes.spaceBtwItems,),
            ],
          ),
        ),
      ),
    );
  }
}
