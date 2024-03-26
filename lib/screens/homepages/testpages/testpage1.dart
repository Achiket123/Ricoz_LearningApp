import 'package:flutter/material.dart';

import 'package:learningapp/screens/homepages/testpages/testpage2.dart';
class Testpage1 extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/ob6.png',
    'assets/ob7.png',
    'assets/ob8.png',
    'assets/ob9.png',
    'assets/ob10.png',
    'assets/ob11.png',
    'assets/ob12.png',
    'assets/ob73.png',
    'assets/ob74.png',
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
                  'assets/ob88.png', 
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
                                color:  Color(0xFF7D7CC9) ,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                'Test Series',
                                style:
                                    TextStyle(color: Color(0xFF7D7CC9) , fontSize: 24.0),
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
                      'Choose Subject to start test session',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 8 / 4,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestPage2(),
                            ),
                          );
                        },
                        child: Container(
                          child: Image.asset(
                            imagePaths[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    itemCount: imagePaths.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
