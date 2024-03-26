import 'package:flutter/material.dart';
import 'package:learningapp/screens/subjectpages/readmanualandrealtedpages/readingmaterialsolution.dart';
import 'package:learningapp/screens/subjectpages/readmanualandrealtedpages/readingmaterialvideos.dart';
import 'package:learningapp/features/shadow.dart';
class Readingmaterialread extends StatefulWidget {
  @override
  _ReadingmaterialreadState createState() => _ReadingmaterialreadState();
}

class _ReadingmaterialreadState extends State<Readingmaterialread> {
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
                    padding: const EdgeInsets.all(8.0),
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
                    child: Text(
                      'Chapter 1- Chemical Reaction & Equations ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16.0),
                    child: Row(
                      children: [
                        _buildToggleButton(
                          'Find Solution',
                          isButton1Selected,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Readingmaterialsol()),
                            );
                          },
                        ),
                        SizedBox(width: 20),
                        _buildToggleButton2(
                          'Reading Manual',
                          isButton2Selected,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Readingmaterialread()),
                            );
                          },
                        ),
                        SizedBox(width: 20),
                        _buildToggleButton(
                          'Concept Video',
                          isButton2Selected,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Readingmaterialvideo()),
                            );
                          },
                        ),
                        
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                   MyColoredShadowContainer(),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildSectionTitle('What are Acids, Bases, and Salts?'),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Many acids and bases occur naturally in nature, such as citric acid in fruits like orange, lemon, etc, tartaric acid in tamarind, malic acid in apples, and lactic acid in milk and milk products, hydrochloric acid in gastric juices.Similarly, many bases are found such as lime water. We use many of these acids in our day-to-day life, such as vinegar or acetic acid in the kitchen, boric acid for laundry, baking soda for the purpose of cooking, washing soda for cleaning, etc. ',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset(
                              'assets/ob75.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
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
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Color(0xFF7D7CC9) : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
  
   Widget _buildToggleButton2(String text, bool isSelected, VoidCallback onTap) {
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
              color:  Color(0xFF7D7CC9) ,
            ),
          ),
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
