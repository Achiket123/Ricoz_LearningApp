import 'package:flutter/material.dart';

Widget buildSectionTitle(String title) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      title,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
