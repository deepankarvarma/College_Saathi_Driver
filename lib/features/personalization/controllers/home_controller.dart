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
  
  Future<void> makeRequest() async {
  try {
    // Start Loading
    TFullScreenLoader.openLoadingDialog(
        'A Driver will assist you soon...', TImages.docerAnimation);

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
      driverId: '', // Initialize driverId to an empty string
      driverName: '',
      driverPhone: '',
    );

    final requestRepository = Get.put(RequestRepository());
    await requestRepository.saveUserRecord(newUser);
  final userRepository = Get.put(UserRepository());
    // Periodically check if driverId is not empty
    while (newUser.driverId.isEmpty) {
      await Future.delayed(Duration(seconds: 1)); // Adjust the delay as needed

      try {
        // Fetch the latest data from the server
        final List<RequestModel> requests = await userRepository.fetchRequests();

        // Update newUser with the latest data
      final updatedRequest = requests.firstWhere((request) => request.id == newUser.id);
        if (updatedRequest != null) {
          newUser.driverId = updatedRequest.driverId;
          newUser.driverName = updatedRequest.driverName;
          newUser.driverPhone = updatedRequest.driverPhone;
          // You might need to update other fields as well based on your data structure
        }
      } catch (e) {
        // Handle the error, e.g., log it or show a message
        print('Error fetching requests: $e');
      }
    }

    // Remove Loader
    TFullScreenLoader.stopLoading();
    // Show Success Message
    TLoaders.successSnackBar(
      title: 'Congratulations',
      message: 'Your request has been accepted',
    );

    // Move to UserDetails screen
    Get.to(() => UserDetails(request: newUser));
  } catch (e) {
    // Remove Loader
    TFullScreenLoader.stopLoading();
    // Show some error
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  }
}

}

