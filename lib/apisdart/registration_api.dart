//import 'dart:developer';
import 'dart:developer';

import 'package:learningapp/apisdart/otp_api.dart';
import 'package:learningapp/database/databaseapi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:learningapp/main.dart';

class RegistrationApi {
  static Future<bool> registerUser({
    required String name,
    required String dateOfBirth,
    required String email,
    required String selectedClass,
    required String location,
    required String courseType,
    required String tuitionMode,
    required String medium,
  }) async {
    try {
      var url = Uri.parse(DatabaseApi.updateProfile);
      var requestBody = {
        "name": name,
        "dateOfBirth": dateOfBirth,
        "email": email,
        "selectedClass": selectedClass,
        "location": location,
        "courseType": courseType,
        "tuitionMode": tuitionMode,
        "medium": medium,
      };

      var response = await http.patch(
        url,
        body: json.encode(requestBody),
        headers: {
          'content-Type': 'application/json',
          "Authorization": "Bearer ${OtpApi.token}"
        },
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        customPrint("register user message", response.body);
        return true;
      } else {
        customPrint("register user error", response.body);
        return false;
      }
    } catch (e) {
      customPrint("register user catch error", e);
      return false;
    }
  }
}
