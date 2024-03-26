import 'package:flutter/material.dart';
import 'package:learningapp/features/buildtitle.dart';
import 'package:learningapp/features/recentlylearnedfeatures/buildtopicrow.dart';
import 'package:learningapp/features/videorow.dart';
class RecentlyLearned extends StatelessWidget {
  final List<String> carouselImages = [
    'assets/ob57.png',
    'assets/ob58.png',
    'assets/ob59.png',
    'assets/ob60.png',
    'assets/ob61.png',
    'assets/ob62.png',
    'assets/ob63.png',
  ];

  final List<String> resourceImages = [
    'assets/ob64.png',
    'assets/ob65.png',
    'assets/ob64.png',
  ];
  final List<String> resourceTexts = ['Text 1', 'Text 2', 'Text 3'];

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
                child: Image.asset('assets/ob56.png', fit: BoxFit.cover),
              ),
            ),
            Column(
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
                            SizedBox(height: MediaQuery.of(context).size.height * 0.12),
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
                              'Recently learned',
                              style: TextStyle(
                                  color: Color(0xFF7D7CC9), fontSize: 24.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      _buildCarouselBox(context, carouselImages),
                      SizedBox(height:16),
                      buildSectionTitle('Topics'),
                     buildTopicRow(context, 'Topic1-Acid', YourChildWidget()),
                      SizedBox(height:16),
                      buildTopicRow(context, 'Topic2-Base', YourChildWidget()),
                       SizedBox(height:16),
                      buildTopicRow(context, 'Topic3-Salt', YourChildWidget()),
                       SizedBox(height:16),
                      buildSectionTitle('Videos'),
                      SizedBox(height:16),
                      buildVideoRow(context, ['assets/ob111.png', 'assets/ob110.png']),
                      SizedBox(height:4),
                      buildVideoRow(context, ['assets/ob110.png', 'assets/ob111.png']),
                      SizedBox(height:16),
                      buildSectionTitle('Reading Material'),
                      SizedBox(height:16),
                      _buildResourceRow(context, resourceImages, resourceTexts),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
   Widget _buildCarouselBox(BuildContext context, List<String> imagePaths) {
    return Container(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.25,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.asset(imagePaths[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }

  // Widget _buildVideoRow(BuildContext context, List<String> images) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: images
  //         .map((image) => _buildVideoBox(context, image))
  //         .toList(),
  //   );
  // }

  // Widget _buildVideoBox(BuildContext context, String imagePath) {
  //   return Container(
  //     width: MediaQuery.of(context).size.width * 0.45,
  //     height: MediaQuery.of(context).size.width * 0.3,
  //     decoration: BoxDecoration(
  //       color: Colors.grey,
  //       borderRadius: BorderRadius.circular(16.0),
  //     ),
  //     child: Image.asset(imagePath, fit: BoxFit.cover),
  //   );
  // }

  Widget _buildResourceRow(
      BuildContext context, List<String> images, List<String> texts) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        images.length,
        (index) => _buildResourceBox(context, images[index], texts[index]),
      ),
    );
  }

  Widget _buildResourceBox(
      BuildContext context, String imagePath, String text) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      height: MediaQuery.of(context).size.width * 0.3 ,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}

class YourChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('');
  }
}
