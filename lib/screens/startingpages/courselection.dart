import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learningapp/screens/startingpages/home.dart';
import 'package:learningapp/features/bottomnavigation.dart';
import 'package:learningapp/apisdart/registration_api.dart';

class CourseSelectionPage extends StatefulWidget {
  final String name;
  final String dob;
  final String email;
  final String selectedClass;
  final String location;

  CourseSelectionPage({
    required this.name,
    required this.dob,
    required this.email,
    required this.selectedClass,
    required this.location,
  });

  @override
  _CourseSelectionPageState createState() => _CourseSelectionPageState();
}

class _CourseSelectionPageState extends State<CourseSelectionPage> {
  String? _courseType;
  String? _tuitionMode;
  String? _medium;
  bool _isContinueEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/ob53.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.275,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: _navigateToHomePage,
              child: Container(
                width: 40,
                height: 40,
                color: Colors.grey,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Section(
                      text: 'Select Course Type',
                      children: [
                        _buildCourseTypeButton('CBSE'),
                        _buildCourseTypeButton('ICSE'),
                        _buildCourseTypeButton('State Board'),
                      ],
                    ),
                    SizedBox(height: 50.0),
                    Section(
                      text: 'Select Tuition Mode',
                      children: [
                        _buildTuitionModeButton('Online'),
                        _buildTuitionModeButton('Offline'),
                        _buildTuitionModeButton2(''),
                      ],
                    ),
                    SizedBox(height: 50.0),
                    Section(
                      text: 'Select Medium',
                      children: [
                        _buildMediumButton('English'),
                        _buildMediumButton('Regional'),
                        _buildMediumButton('Hindi'),
                      ],
                    ),
                    SizedBox(height: 50.0),
                    Center(
                      child: ElevatedButton(
                        onPressed:
                            _isContinueEnabled ? _sendDataToServer : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isContinueEnabled
                              ? Color(0xFF7D7CC9)
                              : Colors.grey,
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  Widget _buildCourseTypeButton(String type) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _courseType = type;
            _checkContinueButton();
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              _courseType == type ? Color(0xFF7D7CC9) : Color(0xFFF1F1F1),
          textStyle: TextStyle(
            color: _courseType == type ? Colors.white : Colors.black,
            fontSize: 10.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          type,
          style: TextStyle(
            color: _courseType == type ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildTuitionModeButton(String mode) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _tuitionMode = mode;
            _checkContinueButton();
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              _tuitionMode == mode ? Color(0xFF7D7CC9) : Color(0xFFF1F1F1),
          textStyle: TextStyle(
            color: _tuitionMode == mode ? Colors.white : Colors.black,
            fontSize: 10.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          mode,
          style: TextStyle(
            color: _tuitionMode == mode ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildMediumButton(String medium) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _medium = medium;
            _checkContinueButton();
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              _medium == medium ? Color(0xFF7D7CC9) : Color(0xFFF1F1F1),
          textStyle: TextStyle(
            color: _medium == medium ? Colors.white : Colors.black,
            fontSize: 10.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          medium,
          style: TextStyle(
            color: _medium == medium ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildTuitionModeButton2(String mode) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.325,
      height: 40,
      child: Opacity(
        opacity: 0.0,
        child: ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            backgroundColor: _tuitionMode == mode
                ? Color.fromARGB(255, 255, 254, 255)
                : Color.fromARGB(255, 255, 254, 255),
            textStyle: TextStyle(
              color: _tuitionMode == mode
                  ? Color.fromARGB(255, 255, 254, 255)
                  : Color.fromARGB(255, 255, 254, 255),
            ),
          ),
          child: Text(mode),
        ),
      ),
    );
  }

  void _checkContinueButton() {
    if (_courseType != null && _tuitionMode != null && _medium != null) {
      setState(() {
        _isContinueEnabled = true;
      });
    }
  }

  void _sendDataToServer() async {
    await RegistrationApi.registerUser(
      name: widget.name,
      dateOfBirth: widget.dob,
      email: widget.email,
      selectedClass: widget.selectedClass,
      location: widget.location,
      courseType: _courseType!,
      tuitionMode: _tuitionMode!,
      medium: _medium!,
    ).then((value) {
      log(value.toString());
      if (value) {
        _navigateToHomePage2(context);
      } else {
        log('Error: Failed to send data to server');
      }
    });
  }
}

void _navigateToHomePage2(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const Navigation()),
  );
}

class Section extends StatelessWidget {
  final String text;
  final List<Widget> children;

  const Section({Key? key, required this.text, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: children,
        ),
      ],
    );
  }
}
