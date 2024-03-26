import 'package:flutter/material.dart';
import 'package:learningapp/screens/tutorpages/tutor.dart';

Widget buildBottomContainer(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 16.0),
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildAvatar(),
        buildTextAndButton(context),
      ],
    ),
  );
}

Widget buildAvatar() {
  return Column(
    children: [
      CircleAvatar(
        radius: 50.0,
        backgroundColor: Color(0xFF7D7CC9),
        child: CircleAvatar(
          radius: 45.0,
          backgroundImage: AssetImage('assets/ob49.png'),
        ),
      ),
    ],
  );
}

Widget buildTextAndButton(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        ' Book Free Demo\n  Lecture Now!!!',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      SizedBox(height: 8.0),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TutorPage()),
          );
        },
        child: Container(
          alignment: Alignment.center,
          width: 120.0, // Adjust width according to your preference
          padding: EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            color: Color(0xFF7D7CC9),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text('Book Now', style: TextStyle(color: Colors.white)),
        ),
      ),
    ],
  );
}
