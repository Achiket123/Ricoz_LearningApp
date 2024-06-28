import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learningapp/main.dart';

class LoginApi {
  final http.Client httpClient;
  final String baseUrl;

  LoginApi(this.httpClient, {required this.baseUrl});

  Future<bool> login(String phoneNumber) async {
    final url = Uri.parse('$baseUrl/api/v1/auth/login');
    final response = await http.post(
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
}
