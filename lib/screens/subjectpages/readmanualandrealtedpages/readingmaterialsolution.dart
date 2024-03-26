import 'package:flutter/material.dart';
import 'package:learningapp/screens/subjectpages/readmanualandrealtedpages/readingmanualrad.dart';
import 'package:learningapp/screens/subjectpages/readmanualandrealtedpages/readingmaterialvideos.dart';
import 'package:learningapp/features/shadow.dart';
class Readingmaterialsol extends StatefulWidget {
  @override
  _ReadingmaterialsolState createState() => _ReadingmaterialsolState();
}

class _ReadingmaterialsolState extends State<Readingmaterialsol> {
  bool isButton1Selected = false;
  bool isButton2Selected = false;
  bool isButton3Selected = false;

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
                  'assets/ob89.png',
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
                    padding: const EdgeInsets.symmetric(vertical:8.0),
                    child: GestureDetector(
                      onTap: () {
                       Navigator.pop(
                        context );
                      },
                      child: Column(
                        children: [
                           SizedBox(height:MediaQuery.of(context).size.height * 0.08),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
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
                                  'Science ',
                                  style:
                                      TextStyle(color: Color(0xFF7D7CC9), fontSize: 24.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16.0),
                    child: Column(
                      children: [
                        Text(
                          'Chapter 1- Chemical Reaction & Equations ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            _buildToggleButton4(
                              'Find Solution',
                              isButton1Selected,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Readingmaterialsol(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(width: 20),
                            _buildToggleButton(
                              'Reading Manual',
                              isButton2Selected,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Readingmaterialread(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(width: 20),
                            _buildToggleButton(
                              'Concept Video',
                              isButton3Selected,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Readingmaterialvideo(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                   MyColoredShadowContainer(),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16.0),
                    child: Column(
                      children: [
                        _buildSectionTitle("Question Desk"),
                        SizedBox(height: 20),
                        _buildContainerWithText(
                          context,
                          "Q.1. Which of the following is a characteristic property of an acid\n A.?",
                        ),
                        SizedBox(height: 10),
                        _buildContainerWithText(
                          context,
                          "Q.2. Which of the following is a characteristic property of an acid?\n A.",
                        ),
                        SizedBox(height: 10),
                        _buildContainerWithText(
                          context,
                          "Q.3. Which of the following is a characteristic property of an acid?\n A.",
                        ),
                      ],
                    ),
                  ),
                  Container(height:MediaQuery.of(context).size.width * 0.05 ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.width * 0.13,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Color(0xFF7D7CC9) : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
          color: isSelected ? Color(0xFF7D7CC9) : Colors.white,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildToggleButton4(String text, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.width * 0.13,
        decoration: BoxDecoration(
          border: Border.all(
            color:  Color(0xFF7D7CC9),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color:  Color(0xFF7D7CC9),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainerWithText(BuildContext context, String text) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
