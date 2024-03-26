import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learningapp/screens/startingpages/home.dart';
import 'package:learningapp/screens/startingpages/onboarding.dart';
import 'package:learningapp/screens/startingpages/login.dart';
import 'package:learningapp/screens/startingpages/signin.dart';

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  List<TextEditingController> _otpControllers =
      List.generate(5, (index) => TextEditingController());

  int _otpExpirationSeconds = 30;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
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
                    style: TextStyle(fontSize: 16),
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
                            style: const TextStyle(fontSize: 8, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
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
                                  builder: (context) => const Login()));
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'OR',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[500]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont Have account ',
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
                  const SizedBox(height: 40),
                  TextButton(
                    onPressed: () {
                      
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

  void _checkIfAllFieldsFilled() {
    bool allFieldsFilled = true;
    for (TextEditingController controller in _otpControllers) {
      if (controller.text.isEmpty) {
        allFieldsFilled = false;
        break;
      }
    }

    if (allFieldsFilled) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }
}
