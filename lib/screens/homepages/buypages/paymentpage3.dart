import 'package:flutter/material.dart';
import 'package:learningapp/screens/homepages/homepage2.dart';
class PaymentPage3 extends StatelessWidget {
  // Define a constant for the success message
  static const String successMessage = 'Payment Successful!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset(
                  'assets/ob28.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              successMessage,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage2()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF7D7CC9),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
              child: Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
