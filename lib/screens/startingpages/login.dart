import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learningapp/apisdart/otp_api.dart';
import 'package:learningapp/screens/startingpages/signin.dart';
import 'package:learningapp/screens/startingpages/onboarding.dart';
//import 'package:learningapp/screens/startingpages/home.dart';
import 'package:learningapp/screens/startingpages/otpage.dart';
import 'package:learningapp/screens/startingpages/policy.dart';
//import 'package:learningapp/apisdart/login_api.dart';
//import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneNumberController = TextEditingController();
  // final LoginApi _loginApi = LoginApi(http.Client(),
  //     baseUrl: 'http://localhost:8000/api/v1/auth/login');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Onboarding()),
                  );
                },
                child: Row(
                  children: [
                    SizedBox(height: 100),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Image.asset(
                    'assets/ob46.png',
                    width: 300,
                    height: 300,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      width: 400,
                      //padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[500],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                '+91',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: _phoneNumberController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter your 10-digit number',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      // _loginApi.login(_phoneNumberController.text).then((_) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => OTPPage()),
                      //   );
                      // }).catchError((error) {
                      //   showDialog(
                      //       context: context,
                      //       builder: (BuildContext context) {
                      //         return AlertDialog(
                      //           title: const Text('Login Error'),
                      //           content: Text('Failed to login:$error'),
                      //           actions: [
                      //             TextButton(onPressed: (){
                      //               Navigator.pop(context);
                      //             }, child: const Text('OK'))
                      //           ],
                      //         );
                      //       });
                      // });
                      print('message');
                      await OtpApi.sendOTP(_phoneNumberController.text)
                          .then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPPage(
                                    phoneNumber: _phoneNumberController.text,
                                    isSignup: false,
                                  )),
                        );

                        // else {
                        //   showDialog(
                        //       context: context,
                        //       builder: (BuildContext context) {
                        //         return AlertDialog(
                        //           title: const Text('Login Error'),
                        //           content: Text('Failed to login'),
                        //           actions: [
                        //             TextButton(
                        //                 onPressed: () {
                        //                   Navigator.pop(context);
                        //                 },
                        //                 child: const Text('OK'))
                        //           ],
                        //         );
                        //       });
                        // }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text('Continue'),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInPage()));
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PolicyPage()),
                      );
                    },
                    child: const Text(
                      'By proceeding you agree to our\nTerms & Conditions and Privacy Policy',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
