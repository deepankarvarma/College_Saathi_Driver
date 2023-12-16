import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_saathi/data/repositories/authentication/authentication_repository.dart';
import 'package:college_saathi/features/authentication/models/request_model.dart';
import 'package:college_saathi/features/authentication/models/user_model.dart';
import 'package:college_saathi/utils/exceptions/firebase_exceptions.dart';
import 'package:college_saathi/utils/exceptions/format_exceptions.dart';
import 'package:college_saathi/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RequestRepository extends GetxController{
    static RequestRepository get instance => Get.find();
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    /// Function to save user data to Firestore.
  Future<void> saveUserRecord(RequestModel user) async {
    try {
      await _db.collection("Requests").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}