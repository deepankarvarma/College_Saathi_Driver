import 'package:college_saathi/common/widgets/loaders/loaders.dart';
import 'package:college_saathi/data/services/network_manager.dart';
import 'package:college_saathi/features/authentication/screens/login/ridehistory.dart';
import 'package:college_saathi/utils/constants/image_strings.dart';
import 'package:college_saathi/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComplaintController extends GetxController{
  static ComplaintController get instance => Get.find();

  final complaintText = TextEditingController();
  GlobalKey<FormState> complaintFormKey = GlobalKey<FormState>();
  Future<void> sendComplaint() async{
    try{ 
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are updating your information...', TImages.acerlogo);
      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if (!complaintFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Update user's first name and last name in firebase
      Map<String, dynamic> name = {
        'Complaint': complaintText.text.trim(),
      };
      // Remove Loader
      TFullScreenLoader.stopLoading();
// Show Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your complaint has been taken care of. ');

// Move to previous screen.
      Get.off(() => const ridehistory());
    }catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}