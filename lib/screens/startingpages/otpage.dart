import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:learningapp/apisdart/auth_api.dart';
import 'package:learningapp/apisdart/otp_api.dart';
import 'package:learningapp/database/databaseapi.dart';
import 'package:learningapp/main.dart';
import 'package:learningapp/screens/startingpages/home.dart';
import 'package:learningapp/screens/startingpages/onboarding.dart';
import 'package:learningapp/screens/startingpages/policy.dart';
import 'package:http/http.dart' as http;

class OTPPage extends StatefulWidget {
  final String phoneNumber;
  final bool isSignup;

  const OTPPage({super.key, required this.phoneNumber, required this.isSignup});
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final List<TextEditingController> _otpControllers =
      List.generate(5, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (index) => FocusNode());
  int _otpExpirationSeconds = 30;
  late Timer _timer;
  // final String baseUrl = 'http://localhost:8000/api/v1/auth/';

  @override
  void initState() {
    super.initState();
    _startCountdown();
    _setUpListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_otpExpirationSeconds > 0) {
          _otpExpirationSeconds--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  void _setUpListeners() {
    for (int i = 0; i < _otpControllers.length; i++) {
      _otpControllers[i].addListener(() {
        if (_otpControllers[i].text.length == 1 &&
            i < _otpControllers.length - 1) {
          _focusNodes[i + 1].requestFocus();
        }
      });
    }
  }

  Future<void> _sendOTP() async {
    try {
      final response = await http.post(
        Uri.parse(DatabaseApi.sendOtp),
        body: {'phone_number': widget.phoneNumber},
      );
      if (response.statusCode == 200) {
        log('OTP sent successfully');
      } else {
        log('Failed to send OTP');
      }
    } catch (e) {
      log('Error sending OTP: $e');
    }
  }

  // Future<bool> _verifyOTP(String otp) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse(DatabaseApi.login),
  //       body: {'phone_number': widget.phoneNumber, 'otp': otp},
  //     );
  //     if (response.statusCode == 200) {
  //       customPrint("Otp verify ", response.body);
  //       log('OTP verification successful');
  //       return true;
  //     } else {
  //       customPrint("Otp verify err ", response.body);
  //       log('OTP verification failed');
  //       return false;
  //     }
  //   } catch (e) {
  //     log('Error verifying OTP: $e');
  //     return false;
  //   }
  // }

  Future<void> _checkIfAllFieldsFilled() async {
    bool allFieldsFilled = true;
    String otp = '';

    for (TextEditingController controller in _otpControllers) {
      if (controller.text.isEmpty) {
        allFieldsFilled = false;
        break;
      }
      otp += controller.text;
    }

    if (allFieldsFilled) {
      if (!widget.isSignup) {
        await OtpApi.login(widget.phoneNumber, otp).then((isVerified) {
          if (isVerified) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('OTP Verification Error'),
                  content: Text('Failed to verify OTP. Please try again.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        });
      }
      else{
        await AuthApi.signup(widget.phoneNumber, otp).then((isVerified) {
          if (isVerified) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('OTP Verification Error'),
                  content: Text('Failed to verify OTP. Please try again.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        });
      }
    }
  }

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
                    const SizedBox(height: 100),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    const Text(
                      'Please enter the OTP sent to your mobile number',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        5,
                        (index) => Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: _otpControllers[index],
                                  focusNode: _focusNodes[index],
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  style: const TextStyle(fontSize: 20),
                                  decoration: const InputDecoration(
                                    counterText: '',
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    _checkIfAllFieldsFilled();
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              index == 0
                                  ? 'Resend Otp'
                                  : index == 4
                                      ? 'OTP expires in \n ($_otpExpirationSeconds sec)'
                                      : '',
                              style: const TextStyle(
                                  fontSize: 8, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 70),
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
            ),
          ],
        ),
      ),
    );
  }
}
