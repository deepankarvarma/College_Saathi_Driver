import 'package:college_saathi/common/widgets/loaders/loaders.dart';
import 'package:college_saathi/data/repositories/authentication/authentication_repository.dart';
import 'package:college_saathi/data/services/network_manager.dart';
import 'package:college_saathi/utils/constants/image_strings.dart';
import 'package:college_saathi/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
// Variables
  final rememberMe = true.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
// Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.appleLogo);
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }
// Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }
// Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
// Login user using EMail & Password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
// Remove Loader
      TFullScreenLoader.stopLoading();
// Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show some error
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
