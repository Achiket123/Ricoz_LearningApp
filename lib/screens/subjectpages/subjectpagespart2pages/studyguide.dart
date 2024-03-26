import 'package:flutter/material.dart';
import 'package:learningapp/screens/subjectpages/subjectpage2relatedpages/subject2.dart';
import 'package:learningapp/features/shadow.dart';
class studyguide extends StatefulWidget {
  @override
  _studyguideState createState() => _studyguideState();
}

class _studyguideState extends State<studyguide> {
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
                  SizedBox(height: 20),
                   MyColoredShadowContainer(),
                  SizedBox(height: 20),
                  SizedBox(height: 30),
                  _buildSectionTitle('Question Paper'),
                  SizedBox(height: 40),
                  Column(
                    children: [
                      YourRowWidget2(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),                      
                    ],
                  ),
                  _buildSectionTitle('Recommended Links'), 
                  SizedBox(height: 20),
                  Column(
                    children: [
                      _buildTopicRow2(
                          context,
                          'Chapter 1- Chemical Reaction & Equations ',
                          YourChildWidget()),
                      SizedBox(height: 16),
                      _buildTopicRow2(context, 'Chapter 2- Acid Bases & Salts',
                          YourChildWidget()),
                      SizedBox(height: 16),
                      _buildTopicRow2(
                          context,
                          'Chapter 3- Metals and Non-metals',
                          YourChildWidget()),
                           SizedBox(height: 16),
                          _buildTopicRow2(
                          context,
                          'Chapter 4- Carbon and Its Compounds',
                          YourChildWidget()),
                          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                      
                    ],
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(
      String text, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.width * 0.1,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Color(0xFF7D7CC9): Colors.grey,
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

class YearWidget2 extends StatelessWidget {
  final String imagePath;
  final String book;

  YearWidget2({required this.imagePath, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.width * 0.33,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          ' $book',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
 Widget _buildTopicRow2(BuildContext context, String text, Widget childWidget) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Subject2(), 
        //   ),
        // );
      },
      child: Container(
        color: Color(0xFFF1F1F1),
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(text,style:TextStyle(color: Colors.blue),),
            ),
            Expanded(
              child: childWidget,
            ),
          ],
        ),
      ),
    );
  }


class YourRowWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        YearWidget2(imagePath: 'assets/ob15.png', book: 'SL Arora'),
        
        YearWidget2(imagePath: 'assets/ob16.png', book: 'RD Sharma'),
       
        YearWidget2(imagePath: 'assets/ob15.png', book: 'HC Verma'),
      ],
    );
  }
}
class YourChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('');
  }
}
