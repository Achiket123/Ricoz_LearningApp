import 'package:flutter/material.dart';
import 'package:learningapp/features/shadow.dart';
class questionpaper extends StatefulWidget {
  @override
  _questionpaperState createState() => _questionpaperState();
}

class _questionpaperState extends State<questionpaper> {
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
                                style: TextStyle(color: Color(0xFF7D7CC9), fontSize: 24.0),
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
                      YourRowWidget(),
                      SizedBox(height:MediaQuery.of(context).size.height * 0.1),
                      YourRowWidget(),
                      SizedBox(height:MediaQuery.of(context).size.height * 0.1),
                      YourRowWidget(),
                      SizedBox(height:MediaQuery.of(context).size.height * 0.1)
                    ],
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

  Widget _buildToggleButton(String text, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.width * 0.1,
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

class YearWidget extends StatelessWidget {
  final String imagePath;
  final String year;

  YearWidget({required this.imagePath, required this.year});

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
          'Year $year',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class YourRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        YearWidget(imagePath: 'assets/ob17.png', year: '2023'),
       
        YearWidget(imagePath: 'assets/ob18.png', year: '2022'),
       
        YearWidget(imagePath: 'assets/ob17.png', year: '2021'),
      ],
    );
  }
}
