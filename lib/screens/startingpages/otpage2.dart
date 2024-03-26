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
                      child: Icon(
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
                   SizedBox(height: 100),
                  Image.asset(
                    'assets/ob46.png',
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Please enter the OTP sent to your mobile number',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      5,
                      (index) => Container(
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
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10), 
                  ElevatedButton(
                    onPressed: () {
                     
                      String enteredOTP = _otpControllers
                          .map((controller) => controller.text)
                          .join();
                      print('Entered OTP: $enteredOTP');

                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text('Continue'),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login()));
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                      ),                      
                    ],
                  ),
                   SizedBox(height: 10),
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
                            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
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
                      Text(
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
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                      ),                      
                    ],
                  ),
                  SizedBox(height: 40),
                  TextButton(
                    onPressed: () {
                      
                    },
                    child: Text(
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
