import 'package:college_saathi/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:college_saathi/utils/constants/sizes.dart';
import 'package:college_saathi/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right:TSizes.defaultSpace,
      top: TDeviceUtils.getAppBarHeight(),
      child: TextButton(
      onPressed: () => OnBoardingController.instance.skipPage(),
      child: const Text('Skip'),
    ));
  }
}

