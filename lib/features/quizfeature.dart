import 'package:flutter/material.dart';
import 'package:learningapp/screens/homepages/quizpages/quizpage1.dart';
Widget buildQuiz(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Quizpage()),
      );
    },
    child: Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/ob48.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 16.0,
            top: MediaQuery.of(context).size.height * 0.0125,
            child: Container(
              width: MediaQuery.of(context).size.height * 0.04,
              height: MediaQuery.of(context).size.height * 0.04,
              decoration: BoxDecoration(
                color: Color(0xFF7D7CC9),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
