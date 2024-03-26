import 'package:flutter/material.dart';
//import 'package:learningapp/subjectdetailpages.dart';
import 'package:learningapp/screens/subjectpages/readmanualandrealtedpages/readingmaterialsolution.dart';
import 'package:learningapp/screens/subjectpages/readmanualandrealtedpages/readingmanualrad.dart';
import 'package:learningapp/features/shadow.dart';
import 'package:learningapp/features/videorelatedfeatures.dart';
class Readingmaterialvideo extends StatefulWidget {
  @override
  _ReadingmaterialvideoState createState() => _ReadingmaterialvideoState();
}

class _ReadingmaterialvideoState extends State<Readingmaterialvideo> {
  bool isButton1Selected = false;
  bool isButton2Selected = false;
  String selectedLanguage = 'eng';
  // final List<String> videoImages = [
  //   'assets/ob13.png',
  //   'assets/ob14.png',
  //   'assets/ob13.png',
  //   'assets/ob14.png',
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
                  'assets/ob22.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:12.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(
                        context );
                      },
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
                      _buildToggleButton(
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
                      _buildToggleButton3(
                        'Concept Video',
                        isButton2Selected,
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
                  SizedBox(height: 20),
                   MyColoredShadowContainer(),
                  SizedBox(height: 30),
                  buildSectionTitle("All Videos"),
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
          color: isSelected ? Color(0xFF7D7CC9): Colors.white,
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
  Widget _buildToggleButton3(String text, bool isSelected, VoidCallback onTap) {
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

  // Widget _buildSectionTitle(String title) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         title,
  //         style: TextStyle(
  //           fontSize: 20.0,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       SizedBox(height: 16),
  //       Column(
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               _buildClickableImageContainer(videoImages[0]),
  //               _buildClickableImageContainer(videoImages[1]),
  //             ],
  //           ),
  //           SizedBox(height: 8),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               _buildClickableImageContainer(videoImages[2]),
  //               _buildClickableImageContainer(videoImages[3]),
  //             ],
  //           ),
  //           SizedBox(height: 8),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               _buildClickableImageContainer(videoImages[4]),
  //               _buildClickableImageContainer(videoImages[5]),
  //             ],
  //           ),
  //           SizedBox(height: 8),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               _buildClickableImageContainer(videoImages[6]),
  //               _buildClickableImageContainer(videoImages[7]),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildClickableImageContainer(String imagePath) {
  //   return GestureDetector(
  //     onTap: () {
  //       // Navigate to a different page when clicked
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => DetailPage(imagePath: imagePath),
  //         ),
  //       );
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width * 0.45,
  //       height: MediaQuery.of(context).size.width * 0.35,
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Colors.grey),
  //         borderRadius: BorderRadius.circular(8.0),
  //       ),
  //       child: Image.asset(
  //         imagePath,
  //         fit: BoxFit.cover,
  //         width: double.infinity,
  //         height: double.infinity,
  //       ),
  //     ),
  //   );
  // }
}
