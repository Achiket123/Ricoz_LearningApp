import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learningapp/screens/homepages/quizpages/quizpage3.dart';
import 'package:learningapp/features/lang2.dart';

class QuizPage2 extends StatefulWidget {
  @override
  _QuizPage2State createState() => _QuizPage2State();
}

class _QuizPage2State extends State<QuizPage2> {
  bool startWithTimer = false;
  int totalQuestions = 2;
  int timerSeconds = 0;
  late Timer timer;
  int timeTaken = 0; 

  
  Map<int, String?> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.19,
                child: Image.asset(
                  'assets/ob3.png', // Replace with your image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context );
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          color: Color(0xFF7D7CC9),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Quizzz',
                          style: TextStyle(
                              color: Color(0xFF7D7CC9), fontSize: 24.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Switch(
                            value: startWithTimer,
                            onChanged: (value) {
                              setState(() {
                                startWithTimer = value;
                                if (startWithTimer) {
                                  startTimer();
                                } else {
                                  stopTimer();
                                }
                              });
                            },
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Start with timer',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(width: 16),
                          if (startWithTimer)
                            Text(
                              formatTime(timerSeconds),
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.red),
                            ),
                        ],
                      ),
                      SizedBox(height: 8),
                      LanguageSelectionWidget2(),
                      SizedBox(height: 16),
                      // First Question
                      buildQuestion(
                        'Q.1. Which of the following is a characteristic property of an acid?',
                        [
                          'A. Bitter Taste',
                          'B. Turns Red litmus Blue',
                          'C. Feels Soft to touch',
                          'D. Produces H+ ion'
                        ],
                        1,
                      ),
                      SizedBox(height: 16),
                      // Second Question
                      buildQuestion(
                        'Q.2. When an acid reacts with a metal, which gas is usually evolved?',
                        ['A. O2', 'B. CO2', 'C. H2', 'D. N2'],
                        2,
                      ),
                      SizedBox(height: 16),
                      // Submit Button
                      buildSubmitButton(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuestion(
      String question, List<String> options, int questionNumber) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        // Rectangular boxes for answers
        for (int i = 0; i < options.length; i++)
          buildAnswerBox(options[i], questionNumber, i + 1),
      ],
    );
  }

  Widget buildAnswerBox(String answer, int questionNumber, int optionNumber) {
    bool isSelected =
        selectedOptions[questionNumber] == '$questionNumber$optionNumber';

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOptions[questionNumber] = '$questionNumber$optionNumber';
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? Color(0xFF7D7CC9) : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              answer,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSubmitButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: selectedOptions.isNotEmpty ? 100 : 80,
        height: 40,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selectedOptions.isNotEmpty ? Color(0xFF7D7CC9) : Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: GestureDetector(
          onTap: selectedOptions.isNotEmpty ? () => _showSubmitDialog() : null,
          child: Center(
            child: Text(
              'Submit',
              style: TextStyle(
                color: selectedOptions.isNotEmpty ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSubmitDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.height * 0.3,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset(
                    'assets/ob4.png', // Replace with your image asset path
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Questions Attempted: ${selectedOptions.values.where((element) => element != null).length}/$totalQuestions',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle button press
                        print('Submit button pressed');
                        Navigator.of(context).pop(); // Close the dialog
                        _showConfirmationDialog(context);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF7D7CC9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Color(0xFF7D7CC9), width: 2),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle button press
                        print('Attempt button pressed');
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF7D7CC9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Color(0xFF7D7CC9), width: 2),
                        ),
                      ),
                      child: Text(
                        'Attempt',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.height * 0.5,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image at the center near the top
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.3, // adjust the width as needed
                    height: MediaQuery.of(context).size.height * 0.2, // adjust the height as needed
                    child: Image.asset(
                      'assets/ob5.png',
                      fit: BoxFit.cover, // Set the box fit here
                    ),
                  ),
                ),
                // Text below the image
                Text(
                  'Wanna Check your Answer',
                  style: TextStyle(fontSize: 16.0),
                ),
                // Padding between text and button
                SizedBox(height: 16.0),
                // Check answer rectangular purple button
                TextButton(
                  onPressed: () {
                    // Navigate to quizpage3 screen
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => QuizPage3(
                          timeTaken: timeTaken,
                          selectedOptions: selectedOptions,
                        ),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF7D7CC9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Color(0xFF7D7CC9), width: 2),
                    ),
                  ),
                  child: Text(
                    'Check Answer',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timerSeconds++;
        timeTaken = timerSeconds; // Update timeTaken variable
      });
    });
  }

  void stopTimer() {
    timer.cancel();
    timerSeconds = 0;
    setState(() {});
  }
}
