import 'package:flutter/material.dart';
import 'package:learningapp/screens/subjectpages/subjectpage2relatedpages/subjectdetailpages.dart';
import 'package:learningapp/features/shadow.dart';
class importantopic extends StatefulWidget {
  @override
  _importantopicState createState() => _importantopicState();
}

class _importantopicState extends State<importantopic> {
  final List<String> videoImages = [
    'assets/ob110.png',
    'assets/ob111.png',
    'assets/ob110.png',
    'assets/ob111.png',
    'assets/ob110.png',
    'assets/ob111.png',
    'assets/ob110.png',
    'assets/ob111.png',
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
                  _buildSectionTitle("Important Topics"),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.1),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildClickableImageContainer(videoImages[0]),
                _buildClickableImageContainer(videoImages[1]),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildClickableImageContainer(videoImages[2]),
                _buildClickableImageContainer(videoImages[3]),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildClickableImageContainer(videoImages[4]),
                _buildClickableImageContainer(videoImages[5]),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildClickableImageContainer(videoImages[6]),
                _buildClickableImageContainer(videoImages[7]),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildClickableImageContainer(String imagePath) {
    return GestureDetector(
      onTap: () {
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(imagePath: imagePath),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.width * 0.28,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
