import 'package:flutter/material.dart';
import 'package:learningapp/screens/compagesandmaterialpages/viewmoresource.dart';
import 'package:learningapp/features/shadow.dart';
import 'package:learningapp/features/pyqdownload.dart';

class Resourcepage2 extends StatelessWidget {
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
                  'assets/ob94.png',
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
                    padding: const EdgeInsets.symmetric(horizontal:24.0),
                    child: GestureDetector(
                      onTap: () {
                       Navigator.pop(
                        context );
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
                                'Mathematics',
                                style: TextStyle(
                                    color: Color(0xFF7D7CC9), fontSize: 24.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                  SizedBox(height: 20),
                  MyColoredShadowContainer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Textbook',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => book()),
                                  );
                                },
                                child: Text(
                                  'View more',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF7D7CC9)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.width * 0.33,
                                  child: Image.asset(
                                    'assets/ob15.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                 Text(
                                  'SL Arora',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 8.0),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.width * 0.33,
                                  child: Image.asset(
                                    'assets/ob16.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                 Text(
                                  'RD Sharma',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 8.0),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.width * 0.33,
                                  child: Image.asset(
                                    'assets/ob15.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                 Text(
                                  'HC Verma',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sample Paper',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => book()),
                                  );
                                },
                                child: Text(
                                  'View more',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF7D7CC9)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.width * 0.33,
                                  child: Image.asset(
                                    'assets/ob17.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Year 2023',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.width * 0.33,
                                  child: Image.asset(
                                    'assets/ob18.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Year 2022',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.width * 0.33,
                                  child: Image.asset(
                                    'assets/ob17.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Year 2021',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Past Year Question Paper',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => book()),
                                  );
                                },
                                child: Text(
                                  'View more',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF7D7CC9)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                buildYearQuestionRow(context, ['2022']),
                               
                                buildYearQuestionRow(context, ['2021']),
                              ],
                            ),
                            Row(
                              children: [
                                buildYearQuestionRow(context, ['2020']),
                               
                                buildYearQuestionRow(context, ['2019']),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Notes',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.width * 0.33,
                                  child: Image.asset(
                                    'assets/ob19.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Formula',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 8.0),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.width * 0.33,
                                  child: Image.asset(
                                    'assets/ob20.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Trigono Glance',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 8.0),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.width * 0.33,
                                  child: Image.asset(
                                    'assets/ob21.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Algebra',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.05 ,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

 
}
