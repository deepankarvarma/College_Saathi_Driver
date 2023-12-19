import 'dart:math';

import 'package:college_saathi/common/styles/spacing_styles.dart';
import 'package:college_saathi/features/authentication/controllers/login/login_controller.dart';
import 'package:college_saathi/features/authentication/screens/login/complaint_page.dart';
import 'package:college_saathi/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:college_saathi/features/authentication/screens/signup/signup.dart';
import 'package:college_saathi/features/personalization/controllers/history_controller.dart';
import 'package:college_saathi/navigation_menu.dart';
import 'package:college_saathi/tapp_bar.dart';
import 'package:college_saathi/utils/constants/colors.dart';
import 'package:college_saathi/utils/constants/image_strings.dart';
import 'package:college_saathi/utils/constants/sizes.dart';
import 'package:college_saathi/utils/constants/text_strings.dart';
import 'package:college_saathi/utils/helpers/helper_functions.dart';
import 'package:college_saathi/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class rideHistory extends StatelessWidget {
  // Reference to the RequestController
  final HistoryController requestController = Get.put(HistoryController());
  final controller = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Ride History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () {
            if (requestController.requests.isEmpty) {
              return const Center(
                child: Text(
                  'No Ride Requests',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              );
            }
  
            // Use the fetched requests data
            return ListView.builder(
              itemCount: requestController.requests.length,
              itemBuilder: (context, index) {
                final request = requestController.requests[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueAccent, // Adjust border color
                      width: 2.0, // Adjust border thickness
                    ),
                    borderRadius:
                        BorderRadius.circular(12), // Adjust border radius
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${request.id}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Modify the following lines based on your RequestModel structure
                      Text('Phone: ${request.phoneNumber}'),
                      const SizedBox(height: 8),
                      Text('Driver: ${request.firstName} ${request.lastName}' ),
                      // Add more fields as needed
                      const SizedBox(height: 8),
                      // Modify the following lines based on your RequestModel structure
                      // Text('Location: ${request.location}'),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
