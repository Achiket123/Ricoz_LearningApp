import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learningapp/main.dart';
class SignupApi {
  final http.Client httpClient;
  final String baseUrl;

  SignupApi(this.httpClient, {required this.baseUrl});

  Future<bool> signup(String phoneNumber) async {
    final url = Uri.parse(
        '$baseUrl/api/v1/auth/signup'); 
    final response = await httpClient.post(
      url,
      body: json.encode({'phoneNumber': phoneNumber}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      customPrint("signup", "Signup successful");
      return true;
    } else {
      throw Exception('Failed to signup: ${response.body}');
    }
  }
}
