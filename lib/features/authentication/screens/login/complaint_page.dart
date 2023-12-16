import 'package:college_saathi/features/authentication/controllers/complaint/complaint_controller.dart';
import 'package:college_saathi/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:college_saathi/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:college_saathi/tapp_bar.dart';
import 'package:college_saathi/utils/constants/sizes.dart';
import 'package:college_saathi/utils/constants/text_strings.dart';
import 'package:college_saathi/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ComplaintPage extends StatelessWidget {
  const ComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ComplaintController());
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(
              TTexts.complainthead,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.complaintSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            // Text Field
            Form(
              key: controller.complaintFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.complaintText,
                    validator: (value) => TValidator.validateEmptyText('Complaint',value),
                    minLines: 1,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: TTexts.complaint,
                      prefixIcon: Icon(Iconsax.direct_right),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.sendComplaint(),
                      child: const Text(TTexts.submit),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
