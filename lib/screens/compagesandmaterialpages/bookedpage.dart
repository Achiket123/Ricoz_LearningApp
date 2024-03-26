import 'package:flutter/material.dart';
import 'package:learningapp/screens/tutorpages/tutor2.dart';

class Bookedpage extends StatelessWidget {
  
  static const String successMessage =
      'Congratulations! Your knowledge boost has been successfully downloaded';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: Image.asset(
                    'assets/ob76.png', 
                    fit: BoxFit.contain, 
                  ),
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
                
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => TutorPage2()),
                );
              },
              style: ElevatedButton.styleFrom(
                
                primary: Color(0xFF7D7CC9), 
                onPrimary: Colors.white, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0), 
                ),
              ),
              child: Text('Book Another Tutor'),
            ),
          ],
        ),
      ),
    );
  }
}
