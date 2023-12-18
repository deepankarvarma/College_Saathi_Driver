import 'package:college_saathi/common/widgets/loaders/loaders.dart';
import 'package:college_saathi/data/repositories/authentication/authentication_repository.dart';
import 'package:college_saathi/data/repositories/request/request_repository.dart';
import 'package:college_saathi/data/repositories/user/user_repository.dart';
import 'package:college_saathi/data/services/network_manager.dart';
import 'package:college_saathi/features/authentication/models/request_model.dart';
import 'package:college_saathi/features/authentication/models/user_model.dart';
import 'package:college_saathi/features/personalization/controllers/user_controller.dart';
import 'package:college_saathi/features/personalization/screens/profile/user_details.dart';
import 'package:college_saathi/utils/constants/image_strings.dart';
import 'package:college_saathi/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final controller = Get.put(UserController());

  final from = TextEditingController();
  
  final to = TextEditingController();
  GlobalKey<FormState> homeFormKey = GlobalKey<FormState>();
  
  Future<void> makeRequest() async{
    try{
    
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
      if (!homeFormKey.currentState!.validate()) {
        // Remove Loader
      TFullScreenLoader.stopLoading();
        return;
      }
      // Register user in the Firebase Authentication & Save user data in the Firebase
      // final userCredential = await AuthenticationRepository.instance
      //     .registerWithEmailAndPassword(
      //         email.text.trim(), password.text.trim());
    
      final UserModel user = controller.user.value;

      // Create RequestModel with user details
      final newUser = RequestModel(
        id: user.id,
        source: from.text.trim(),
        destination: to.text.trim(),
        isAccepted: false,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        phoneNumber: user.phoneNumber,
        driverId: '',
        driverName: '',
        driverPhone: '',
      );

      final userRepository = Get.put(RequestRepository());
      await userRepository.saveUserRecord(newUser);
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your request has been sent');

      // Move to Verify Email Screen
      Get.to(() => UserDetails(request: newUser));
      
    }catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show some error
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

