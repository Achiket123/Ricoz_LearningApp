import 'package:flutter/material.dart';

Widget buildTopicRow(BuildContext context, String text, Widget childWidget) {
  return Container(
    color: Color(0xFFF1F1F1),
    width: double.infinity,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
        Expanded(
          child: childWidget,
        ),
      ],
    ),
  );
}
