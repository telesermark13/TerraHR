
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth; // Import firebase_auth
import 'package:employee_attendance_flutter/app/data/model/user_data_model.dart' as user_model; // Added prefix for User model
import '../../../core/utils/storage_utils.dart';
import '../../api/api_client.dart';
import '../../api/api_path.dart';

class HomeRepository {
  HomeRepository();

  Future<dynamic> createAttendance(String address, String coordinates) async {
    String email = StorageUtils.instance.getUsername();
    AppUtils.printMessage("Email: $email");
    try {
      Map<String, String> body = {
        "email": email,
        "current_address": address,
        "coordinate": coordinates
      };
      final response =
          await ApiClient.client.postAPi(APIPath.kAttendance, body: body);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getUserInfo() async {
    // Replace API call with Cloud Firestore call
    try {
      // Get the current user from Firebase Authentication using the 'auth' prefix
      auth.User? currentUser = auth.FirebaseAuth.instance.currentUser;
      if (currentUser == null) throw "No user signed in"; // Handle the case where no user is signed in

      String? userId = currentUser.uid; // Explicitly declare as String?

      // Changed from .get() on collection to .doc(userId).get()
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users') // Ensure this collection name matches your Firestore setup
          .doc(userId) // Get a specific document by user ID
          .get();

      if (userDoc.exists) {
        // Document exists, process the data
        AppUtils.printMessage("User data from Firestore: ${userDoc.data()}");
        // Safely access data and convert to User object
        final userData = userDoc.data();
        if (userData == null) throw "User data is empty"; // Explicitly cast to Map<String, dynamic>
        user_model.User user = user_model.User.fromJson(userData as Map<String, dynamic>);
        return user; // Or a structure similar to your original API response if needed
      } else {
        // Document doesn't exist
 throw "User document with ID $userId does not exist"; // Handle this case appropriately
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getOfficeLocation() async {
    try {
      final response =
          await ApiClient.client.getApi(APIPath.kGetOfficeLocation);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getAttendanceStatus() async {
    try {
      final response =
          await ApiClient.client.getApi(APIPath.kGetAttendanceStatus);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
