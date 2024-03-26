import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:learningapp/screens/compagesandmaterialpages/viewmore.dart';
import 'package:learningapp/features/shadow.dart';
import 'package:learningapp/features/lang2.dart';
import 'package:learningapp/features/quizfeature.dart';
import 'package:learningapp/features/bottomcontainer.dart';
import 'package:learningapp/features/videorow.dart';
import 'package:learningapp/features/tutorfeature/togglebutton.dart';
import 'package:learningapp/features/videocarousel.dart';
class Subject2 extends StatefulWidget {
  @override
  _Subject2State createState() => _Subject2State();
}

class _Subject2State extends State<Subject2> {
  bool isButton1Selected = false;
  bool isButton2Selected = false;
  // final List<String> videoImages = [
  //   'assets/ob13.png',
  //   'assets/ob14.png',
  //   'assets/ob13.png',
  //   'assets/ob14.png',
  // ];

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
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                      context );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(height:MediaQuery.of(context).size.height * 0.08),
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
                                style:
                                    TextStyle(color: Color(0xFF7D7CC9), fontSize: 24.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
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
                              'NCERT sol.',
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
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                   MyColoredShadowContainer(),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16.0),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSectionTitle("All Videos"),
                       // SizedBox(width: MediaQuery.of(context).size.width * 0.6),
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        buildVideoCarousel(),
                        SizedBox(height: 20),
                        buildBottomContainer(context),
                        SizedBox(height: 20.0),
                        _buildSectionTitle("Quizzz"),
                        SizedBox(height: 20),
                        buildQuiz(context),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSectionTitle("Reading Material"),
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
                        
                        // Using ImageRow widget
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
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }


  // Widget _buildVideoCarousel() {
  //   return CarouselSlider(
  //     options: CarouselOptions(
  //       height: 195.0,
  //       enableInfiniteScroll: false,
  //       viewportFraction: 0.84,
  //     ),
  //     items: List.generate(
  //       videoImages.length,
  //       (index) => _buildVideoCarouselItem(videoImages[index]),
  //     ),
  //   );
  // }

  // Widget _buildVideoCarouselItem(String videoImagePath) {
  //   return Container(
  //     width: double.infinity,
  //     margin: EdgeInsets.symmetric(horizontal: 4.0),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(8.0),
  //       border: Border.all(color: Colors.grey),
  //     ),
  //     child: Image.asset(
  //       videoImagePath,
  //       fit: BoxFit.cover,
  //     ),
  //   );
  // }
}
