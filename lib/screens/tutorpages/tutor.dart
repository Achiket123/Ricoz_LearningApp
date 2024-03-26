import 'package:flutter/material.dart';
import 'package:learningapp/features/shadow.dart';
import 'package:learningapp/screens/tutorpages/tutorbookpage1.dart';
import 'package:learningapp/features/tutorfeature/togglebutton.dart';
import 'package:learningapp/features/tutorfeature/togglebutton2.dart';

class TutorPage extends StatefulWidget {
  @override
  _TutorPageState createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  bool isButton1Selected = false;
  bool isButton2Selected = false;
  bool isButton3Selected = false;
  bool isButton4Selected = false;
  bool isButton5Selected = false;
  bool isButton6Selected = false;
  bool isButton7Selected = false;
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  bool isNextButtonEnabled = false;
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != dateOfBirthController) {
      setState(() {
        dateOfBirthController.text = picked.toString();
      });
    }
  }

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
                width: MediaQuery.of(context).size.width * 0.55,
                height: MediaQuery.of(context).size.height * 0.19,
                child: Image.asset(
                  'assets/ob93.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.08),
                          Row(
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
                                'Tutor',
                                style: TextStyle(
                                  color: Color(0xFF7D7CC9),
                                  fontSize: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 17),
                      buildToggleButton(
                        context,
                        'Offline Tutor',
                        isButton1Selected,
                        () {
                          setState(() {
                            isButton1Selected = !isButton1Selected;
                            isButton2Selected = false;
                          });
                        },
                      ),
                      SizedBox(width: 20),
                      buildToggleButton(
                        context,
                        'Online Tutor',
                        isButton2Selected,
                        () {
                          setState(() {
                            isButton1Selected = false;
                            isButton2Selected = !isButton2Selected;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 17),
                        buildToggleButton2(
                          context,
                          'Science',
                          isButton3Selected,
                          () {
                            setState(() {
                              isButton3Selected = !isButton3Selected;
                              isButton4Selected = false;
                              isButton5Selected = false;
                              isButton6Selected = false;
                              isButton7Selected = false;
                            });
                          },
                        ),
                        SizedBox(width: 10),
                        buildToggleButton2(
                          context,
                          'Maths',
                          isButton4Selected,
                          () {
                            setState(() {
                              isButton3Selected = false;
                              isButton4Selected = !isButton4Selected;
                              isButton5Selected = false;
                              isButton6Selected = false;
                              isButton7Selected = false;
                            });
                          },
                        ),
                        SizedBox(width: 10),
                        buildToggleButton2(
                          context,
                          'Hindi',
                          isButton5Selected,
                          () {
                            setState(() {
                              isButton3Selected = false;
                              isButton4Selected = false;
                              isButton5Selected = !isButton5Selected;
                              isButton6Selected = false;
                              isButton7Selected = false;
                            });
                          },
                        ),
                        SizedBox(width: 10),
                        buildToggleButton2(
                          context,
                          'English',
                          isButton6Selected,
                          () {
                            setState(() {
                              isButton3Selected = false;
                              isButton4Selected = false;
                              isButton5Selected = false;
                              isButton6Selected = !isButton6Selected;
                              isButton7Selected = false;
                            });
                          },
                        ),
                        SizedBox(width: 10),
                        buildToggleButton2(
                          context,
                          'History',
                          isButton7Selected,
                          () {
                            setState(() {
                              isButton3Selected = false;
                              isButton4Selected = false;
                              isButton5Selected = false;
                              isButton6Selected = false;
                              isButton7Selected = !isButton7Selected;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  MyColoredShadowContainer(),
                  SizedBox(height: 20),
                  _buildGrayContainer(
                    'assets/ob91.png',
                    'Samaira Reddy',
                    'Math, Science',
                    '5 years experience',
                    'assets/ob92.png',
                    'Alice Smith',
                    'English Tutor',
                    '3 years experience',
                  ),
                  SizedBox(height: 20),
                  _buildGrayContainer(
                    'assets/ob91.png',
                    'Samaira Reddy',
                    'Math, Science',
                    '5 years experience',
                    'assets/ob92.png',
                    'Alice Smith',
                    'English Tutor',
                    '3 years experience',
                  ),
                  SizedBox(height: 20),
                  _buildGrayContainer(
                    'assets/ob91.png',
                    'Samaira Reddy',
                    'Math, Science',
                    '5 years experience',
                    'assets/ob92.png',
                    'Alice Smith',
                    'English Tutor',
                    '3 years experience',
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrayContainer(
      String imageName1,
      String text1_1,
      String text1_2,
      String text1_3,
      String imageName2,
      String text2_1,
      String text2_2,
      String text2_3) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:24.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TutorBookPage1(
                    tutorImage: imageName1,
                  ),
                ),
              );
            },
            child: _buildSingleGrayContainer(
                imageName1, text1_1, text1_2, text1_3),
          ),
          SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TutorBookPage1(
                    tutorImage: imageName2,
                  ),
                ),
              );
            },
            child: _buildSingleGrayContainer(
                imageName2, text2_1, text2_2, text2_3),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleGrayContainer(String imageName, String text1, String text2,
      String text3) {
    String experienceNumber = text3.replaceAll(RegExp(r'[^0-9]'), '');

    return Container(
      width: MediaQuery.of(context).size.width * 0.38,
      height: MediaQuery.of(context).size.width * 0.48,
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue,
            backgroundImage: AssetImage(imageName),
          ),
          SizedBox(height: 8),
          Text(
            text1,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            text2,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 8),
          RichText(
            text: TextSpan(
              text: '★ ',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF7D7CC9),
              ),
              children: [
                TextSpan(
                  text: 'Rating ',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                TextSpan(
                  text: '     ',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                TextSpan(
                  text: experienceNumber,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF7D7CC9),
                  ),
                ),
                TextSpan(
                  text: ' yr Exp',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
