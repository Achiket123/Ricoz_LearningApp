import 'package:flutter/material.dart';
import 'package:learningapp/screens/homepages/buypages/buysubjectpage2.dart';
class BuySubjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
             width: MediaQuery.of(context).size.width * 0.55,
                height: MediaQuery.of(context).size.height * 0.19,
              child: Image.asset(
                'assets/ob86.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:16.0),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(
                        context );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top:30.0),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              color:  Color(0xFF7D7CC9),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 16),
                            Text(
                              'Buy Subject',
                              style: TextStyle(
                                color:  Color(0xFF7D7CC9),
                                fontSize: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildImageWithButton(
                              context, 'assets/ob34.png'),
                          SizedBox(height: 16),
                          _buildImageWithButton(
                              context, 'assets/ob35.png'),
                          SizedBox(height: 16),
                          _buildImageWithButton(
                              context, 'assets/ob36.png'),
                        ],
                      ),
                    ),
                  ),
                 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageWithButton(BuildContext context, String imagePath) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            decoration: BoxDecoration(
              color:  Color(0xFF7D7CC9),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuySubjectPage2()),
                );
              },
              child: Text(
                'View More',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
