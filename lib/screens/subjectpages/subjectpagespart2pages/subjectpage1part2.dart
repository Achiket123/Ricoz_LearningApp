import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:learningapp/screens/compagesandmaterialpages/viewmore.dart';
import 'package:learningapp/screens/subjectpages/subjectpagespart2pages/importantopic.dart';
import 'package:learningapp/screens/subjectpages/subjectpagespart2pages/questionpaper.dart';
import 'package:learningapp/screens/subjectpages/subjectpagespart2pages/ebooks.dart';
import 'package:learningapp/screens/subjectpages/subjectpage2relatedpages/subject2.dart';
import 'package:learningapp/screens/subjectpages/subjectpagespart2pages/studyguide.dart';
import 'package:learningapp/features/shadow.dart';
import 'package:learningapp/features/videorow.dart';
import 'package:learningapp/features/lang2.dart';
import 'package:learningapp/features/quizfeature.dart';
import 'package:learningapp/features/tutorfeature/togglebutton.dart';
import 'package:learningapp/features/videocarousel.dart';

class Subjectpage1 extends StatefulWidget {
  @override
  _Subjectpage1State createState() => _Subjectpage1State();
}

class _Subjectpage1State extends State<Subjectpage1> {
  bool isButton1Selected = false;
  bool isButton2Selected = false;
  String selectedLanguage = 'eng';
  final List<String> videoImages = [
    'assets/ob13.png',
    'assets/ob14.png',
    'assets/ob13.png',
    'assets/ob14.png',
  ];

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
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
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
                                'Science ',
                                style: TextStyle(
                                    color: Color(0xFF7D7CC9), fontSize: 24.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Unlock the Universe with NAME Science ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16.0),
                    child: Row(
                      children: [
                        buildToggleButton(
                          context,
                          'NCERT lesson',
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
                          'NCERT solu.',
                          isButton2Selected,
                          () {
                            setState(() {
                              isButton1Selected = false;
                              isButton2Selected = !isButton2Selected;
                            });
                          },
                        ),
                        Spacer(),
                        LanguageSelectionWidget2(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  MyColoredShadowContainer(),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildSectionTitle2(
                            "Download NCERT Class 10 Science Book"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ViewMore()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF7D7CC9),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildTopicRow(
                          context,
                          'Chapter 1- Chemical Reaction & Equations',
                          Subject2(),
                        ),
                        SizedBox(height: 16),
                        _buildTopicRow(
                          context,
                          'Chapter 2- Acid Bases & Salts',
                          Subject2(),
                        ),
                        SizedBox(height: 16),
                        _buildTopicRow(
                          context,
                          'Chapter 3- Metals and Non-metals',
                          Subject2(),
                        ),
                        SizedBox(height: 16),
                        _buildTopicRow(
                          context,
                          'Chapter 4- Carbon and Its Compounds',
                          Subject2(),
                        ),
                        SizedBox(height: 16),
                        _buildTopicRow(
                          context,
                          'Chapter 5- Life Process',
                          Subject2(),
                        ),
                        SizedBox(height: 16),
                        _buildTopicRow(
                          context,
                          'Chapter 6- Control and Coordination',
                          Subject2(),
                        ),
                        SizedBox(height: 16),
                        _buildTopicRow(
                          context,
                          'Chapter 7- How Do Organisms Reproduce?',
                          Subject2(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSectionTitle("Popular Videos"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ViewMore()),
                            );
                          },
                          child: Text(
                            'View All',
                            style: TextStyle(
                                color: Color(0xFF7D7CC9),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  buildVideoCarousel(),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildSectionTitle("Class Material"),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16.0),
                    child: Row(
                      children: [
                        _buildWhiteBox('Important Topics', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => importantopic()),
                          );
                        }),
                        SizedBox(width: 8.0),
                        _buildWhiteBox('Question Papers', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => questionpaper()),
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16.0),
                    child: Row(
                      children: [
                        _buildWhiteBox('Study Guides', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => studyguide()),
                          );
                        }),
                        SizedBox(width: 8.0),
                        _buildWhiteBox('E- books & PDF', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Ebook()),
                          );
                        }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20.0),
                        _buildSectionTitle("Quizzz"),
                        SizedBox(height: 20),
                        buildQuiz(context),
                        SizedBox(height: 20.0),
                        _buildSectionTitle("Reading Material"),
                        SizedBox(height: 20.0),
                        buildVideoRow(
                            context, ['assets/ob111.png', 'assets/ob110.png']),
                        const SizedBox(height: 4),
                        buildVideoRow(
                            context, ['assets/ob110.png', 'assets/ob111.png']),
                        SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
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
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSectionTitle2(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xFF7D7CC9),
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildWhiteBox(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildTopicRow(BuildContext context, String text, Widget childWidget) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => childWidget,
          ),
        );
      },
      child: Container(
        color: Color(0xFFF1F1F1),
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}
