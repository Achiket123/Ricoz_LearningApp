import 'package:flutter/material.dart';
import 'package:learningapp/screens/homepages/testpages/testpage1.dart';

import 'package:learningapp/screens/homepages/testpages/testseriespag1.dart';
import 'package:learningapp/screens/homepages/testpages/testseriespage2.dart';
class TestPage2 extends StatefulWidget {
  @override
  _TestPage2State createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  List<bool> showAdditionalContainers = List.generate(7, (index) => false);
  List<String> customChapterNames = [
    'Chemical Reaction & Equations ',
    'Acid Bases & Salts',
    'Metals and Non-metals',
    'Carbon and Its Compounds',
    'Life Process',
    'Control and Coordination',
    'How Do Organisms Reproduce?',
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Testpage1()),
                        );
                      },
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                color:  Color(0xFF7D7CC9) ,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                'Test Series',
                                style: TextStyle(color:  Color(0xFF7D7CC9) , fontSize: 24.0),
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
                      'Science',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(7, (index) {
                      return Column(
                        children: [
                          buildResponsiveContainer(
                            Color(0xFFF1F1F1),
                            context,
                            'Chapter ${index + 1}- ${getChapterTitle(index)}',
                            ['Test 01', 'Test 02', 'Test 3'],
                            [
                              'Result',
                              'Resume',
                              'Take Test',
                            ],
                            index,
                          ),
                          SizedBox(height: 16),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getChapterTitle(int index) {
    return customChapterNames[index];
  }

  Widget buildResponsiveContainer(
    Color color,
    BuildContext context,
    String text,
    List<String> additionalContainerTexts,
    List<String> customButtonLabels,
    int index,
  ) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.width * 0.15,
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showAdditionalContainers[index] = !showAdditionalContainers[index];
                  });
                },
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        if (showAdditionalContainers[index])
          for (int i = 0; i < 3; i++)
            GestureDetector(
              onTap: () {
                
                navigateToPage(index, i);
              },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.15,
                  color: color,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          additionalContainerTexts[i],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          navigateToPage(index, i);
                        },
                        style: ElevatedButton.styleFrom(
                          primary:  Color(0xFF7D7CC9) ,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          customButtonLabels[i],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ],
    );
  }

  void navigateToPage(int chapterIndex, int testIndex) {
   
    if (testIndex == 0) {
     Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>Testseriespage2(timeTaken: 0,selectedOptions: {},)),
                        );     
      
      
    } else if (testIndex == 1) {
      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Testseriespage1()),
                        );     
    
    } else if (testIndex == 2) {
      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Testseriespage1()),
                        );     
      
    }
  }
}
