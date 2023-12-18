
import 'package:college_saathi/data/repositories/user/user_repository.dart';
import 'package:college_saathi/features/personalization/models/events_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EventsController extends GetxController {
  RxList<EventsModel> requests = <EventsModel>[].obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    try {
      final allRequests = await userRepository.fetchEvents();
      requests(allRequests);
    } catch (e) {
      requests(<EventsModel>[]); // Handle the error as needed
    }
  }
}


