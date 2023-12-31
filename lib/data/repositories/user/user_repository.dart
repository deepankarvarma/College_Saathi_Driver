import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_saathi/data/repositories/authentication/authentication_repository.dart';
import 'package:college_saathi/features/authentication/models/history_model.dart';
import 'package:college_saathi/features/authentication/models/request_model.dart';
import 'package:college_saathi/features/authentication/models/user_model.dart';
import 'package:college_saathi/features/personalization/models/contacts_model.dart';
import 'package:college_saathi/features/personalization/models/events_model.dart';
import 'package:college_saathi/features/personalization/models/vendors_model.dart';
import 'package:college_saathi/utils/exceptions/firebase_exceptions.dart';
import 'package:college_saathi/utils/exceptions/format_exceptions.dart';
import 'package:college_saathi/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<EventsModel>> fetchEvents() async {
    try {
      final querySnapshot = await _db.collection("Events").get();

      final requests = querySnapshot.docs
          .map((doc) => EventsModel.fromSnapshot(doc))
          .toList();

      return requests;
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
  Future<List<VendorsModel>> fetchVendors() async {
    try {
      final querySnapshot = await _db.collection("Vendors").get();

      final requests = querySnapshot.docs
          .map((doc) => VendorsModel.fromSnapshot(doc))
          .toList();

      return requests;
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
  Future<List<HistoryModel>> fetchHistory() async {
  try {
    // Get the current user ID
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw 'User not authenticated';
    }

    // Use the current user ID to fetch history
    final querySnapshot = await FirebaseFirestore.instance
        .collection('History')
        .doc(user.uid) // Using the current user's ID
        .collection('CompletedRequests')
        .get();

    final history = querySnapshot.docs
        .map((doc) => HistoryModel.fromSnapshot(doc))
        .toList();

    return history;
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
  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
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
  Future<List<ContactsModel>> fetchContacts() async {
    try {
      final querySnapshot = await _db.collection("Contacts").get();

      final requests = querySnapshot.docs
          .map((doc) => ContactsModel.fromSnapshot(doc))
          .toList();

      return requests;
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
  // Function to fetch user details on the basis of User ID
  Future<List<RequestModel>> fetchRequests() async {
  try {
    final querySnapshot = await _db.collection("Requests").get();
    
    final requests = querySnapshot.docs
        .map((doc) => RequestModel.fromSnapshot(doc))
        .toList();

    return requests;
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
  // Function to fetch user details on the basis of User ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
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

  // Function to update user data in firestore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(updatedUser.id).set(updatedUser.toJson());
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

  // Update any field in specific user collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
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

  // Function to remove user data from firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
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
