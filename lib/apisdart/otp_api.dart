import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:learningapp/database/databaseapi.dart';
import 'package:learningapp/main.dart';

class OtpApi {
  static String token = "";

  static Future<bool> sendOTP(String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse(DatabaseApi.sendOtp),
        body: json.encode({'phone_number': phoneNumber}),
        headers: {'Content-Type': 'application/json'},
      );
      log("url :: ${DatabaseApi.sendOtp}");
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to send OTP: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error sending OTP: $e');
    }
  }

  static Future<bool> login(String phoneNumber, String otp) async {
    try {
      customPrint("Phone number", phoneNumber);
      final response = await http.post(Uri.parse(DatabaseApi.login),
          body: json.encode({'phone_number': phoneNumber, 'otp': otp}),
          headers: {"content-type": "application/json"});
      if (response.statusCode == 200) {
        customPrint("message", "");

        final Map<String, dynamic> responseData = json.decode(response.body);
        token = responseData['token'];
        await saveTokenLocal(responseData['token']);
        return true;
      } else {
        log('Failed to verify OTP: ${response.body}');
        return false;
      }
    } catch (e) {
      throw Exception('Error verifying OTP: $e');
    }
  }

  static Future<void> saveTokenLocal(String token) async {
    await prefs!.setString('token', token);
  }

  static Future<void> removeTokenLocal() async {
    token = "";
    await prefs!.remove('token');
  }

  static String getTokenLocal() {
    return prefs!.getString('token') ?? "";
  }
}
