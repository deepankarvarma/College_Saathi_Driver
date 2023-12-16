import 'dart:math';

import 'package:college_saathi/common/styles/spacing_styles.dart';
import 'package:college_saathi/features/authentication/controllers/login/login_controller.dart';
import 'package:college_saathi/features/authentication/screens/login/complaint_page.dart';
import 'package:college_saathi/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:college_saathi/features/authentication/screens/signup/signup.dart';
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

class ridehistory extends StatelessWidget {
  const ridehistory({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Ride History'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: List.generate(
              10,
              (index) => RideHistoryItem(
                rideId: Random().nextInt(90) + 10,
                isCompleted: index.isEven,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RideHistoryItem extends StatefulWidget {
  final int rideId;
  final bool isCompleted;

  RideHistoryItem({
    required this.rideId,
    required this.isCompleted,
  });

  @override
  _RideHistoryItemState createState() => _RideHistoryItemState();
}

class _RideHistoryItemState extends State<RideHistoryItem> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          ListTile(
            title: Text('Ride from Place A to Place B'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rickshaw ID: ${widget.rideId}'),
                Text('Fare: Rs 10'),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: _rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          _rating = rating;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            onTap: () {
              // Handle tap event for each ride item
            },
          ),
          Positioned(
            bottom: 32,
            right: 8,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const ComplaintPage()),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(6),
                shape: CircleBorder(),
              ),
              child: Container(
                width: 24,
                height: 24,
                child: Icon(Icons.arrow_outward, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
