import 'dart:convert';
//import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:learningapp/database/databaseapi.dart';
import 'package:learningapp/main.dart';

class AuthApi {
  final http.Client httpClient;
  final String baseUrl;

  AuthApi(this.httpClient, {required this.baseUrl});

  Future<bool> login(String phoneNumber) async {
    final url = Uri.parse('$baseUrl/api/v1/auth/login/');
    final response = await httpClient.post(
      url,
      body: json.encode({'phoneNumber': phoneNumber}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      customPrint("login", "Login successful");
      return true;
    } else {
      return false;
      // Exception('Failed to login: ${response.body}');
    }
  }

  static Future<bool> signup(String phoneNumber, String otp) async {
    final url = Uri.parse("${DatabaseApi.signUp}/");
    final response = await http.post(
      url,
      body: json.encode({'phone_number': phoneNumber, "otp": otp}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      customPrint("signup", "Signup successful");
      return true;
    } else {
      return false;

      // Exception('Failed to signup: ${response.body}');
    }
  }

  Future<bool> verifyOTP(String otp) async {
    final url = Uri.parse('$baseUrl/v1/auth/sendotp');
    final response = await httpClient.post(
      url,
      body: json.encode({'otp': otp}),
      headers: {'Content-Type': 'application/json'},
    );
    final jsonData = json.decode(response.body);
    customPrint("OTP response", jsonData);
    if (response.statusCode == 200 && jsonData["success"] == true) {
      customPrint("otp", "verified");
      return true;
    } else {
      return false;

      // Exception('Failed to verify OTP: ${response.body}');
    }
  }
}
