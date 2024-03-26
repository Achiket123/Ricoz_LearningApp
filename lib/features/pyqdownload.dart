import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learningapp/screens/compagesandmaterialpages/downloadnotifypage.dart';
import 'package:learningapp/screens/compagesandmaterialpages/pyqcbse.dart';

Widget buildYearQuestionRow(BuildContext context, List<String> years) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: years.map((year) => _buildYearQuestionBox(context, year)).toList(),
    ),
  );
}

Widget _buildYearQuestionBox(BuildContext context, String year) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuestionPaper()),
      );
    },
    child: Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.1,
      color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Text('Year $year'),
          GestureDetector(
            onTap: () {
              _showDialog(context);
            },
            child: Container(
              width: 45,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF7D7CC9),
              ),
              child: const Icon(
                Icons.download,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Future<void> _showDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Show the dialog
      return AlertDialog(
        content: Container(
          height: MediaQuery.of(context).size.width * 0.3,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF7D7CC9),
                ),
                child: const Center(
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 40.0,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                'Downloading your file',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
  await Future.delayed(Duration(seconds: 3));
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => DetailPage()),
  );
}
