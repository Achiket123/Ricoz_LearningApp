import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:learningapp/features/rateusbar.dart';
import 'package:learningapp/features/recentlearnfeature.dart';
import 'package:learningapp/features/sidedrawer.dart';
import 'package:learningapp/features/quizfeature.dart';
import 'package:learningapp/features/searchbar1.dart';
import 'package:learningapp/features/bottomcontainer.dart';
import 'package:learningapp/features/buildtitle.dart';
import 'package:learningapp/screens/homepages/notifypages/notify1.dart';
import 'package:learningapp/screens/compagesandmaterialpages/viewmore.dart';
import 'package:learningapp/features/videocarousel.dart';
class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> subjects = [
    'Science',
    'Maths',
    'Geography',
    'Civics',
    'History',
    'Hindi',
    'English'
  ];
  final List<String> images = [
    'assets/ob66.png',
    'assets/ob67.png',
    'assets/ob67.png',
    'assets/ob69.png',
    'assets/ob70.png',
    'assets/ob71.png',
    'assets/ob72.png',
  ];

  final List<String> videoImages = [
    'assets/ob13.png',
    'assets/ob108.png',
    'assets/ob13.png',
    'assets/ob108.png',
  ];
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSearchBar(),
                  SizedBox(height: 10),
                  buildSectionTitle("Suggested Subject"),
                  SizedBox(height: 10),
                  _buildCarousel(),
                  buildBottomContainer(context),
                  SizedBox(height: 10),
                  buildSectionTitle("Recently Learned"),
                  buildRecentlyLearned(context),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildSectionTitle("Popular Videos"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ViewMore()),
                          );
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                              color: Color(0xFF7D7CC9),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  buildVideoCarousel(),
                  SizedBox(height: 30),
                  buildSectionTitle("Rate us"),
                  SizedBox(height: 8.0),
                  buildRatingSection(),
                  SizedBox(height: 30),
                  buildSectionTitle("Quiz"),
                  SizedBox(height: 8.0),
                  buildQuiz(context),
                  Container(height: MediaQuery.of(context).size.width * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: SideDrawer(context),
      
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: 25),
              CircleAvatar(
                backgroundImage: AssetImage('assets/ob96.png'),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Evening',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF7D7CC9),
                    ),
                  ),
                  Text(
                    'Learner!',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7D7CC9),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              height: MediaQuery.of(context).size.height * 0.19,
              child: Image.asset(
                'assets/ob109.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotifyPage1(),
                            ),
                          );
                        },
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(Icons.dehaze),
                        onPressed: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 155.0,
        enableInfiniteScroll: false,
        viewportFraction: 0.5,
      ),
      items: List.generate(
        subjects.length,
        (index) => _buildCarouselItem(subjects[index], images[index]),
      ),
    );
  }

  Widget _buildCarouselItem(String text, String imagePath) {
    return Container(
      width: 155.0,
      height: 155.0,
      margin: EdgeInsets.only(left: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: double.infinity,
              height: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildVideoCarousel() {
  //   return CarouselSlider(
  //     options: CarouselOptions(
  //       height: 165.0,
  //       enableInfiniteScroll: false,
  //       viewportFraction: 0.84,
  //     ),
  //     items: List.generate(
  //       videoImages.length,
  //       (index) => _buildVideoCarouselItem(videoImages[index]),
  //     ),
  //   );
  // }

  // Widget _buildVideoCarouselItem(String videoImagePath) {
  //   return Container(
  //     width: double.infinity,
  //     margin: EdgeInsets.symmetric(horizontal: 4.0),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(8.0),
  //       border: Border.all(color: Colors.grey),
  //     ),
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(8.0),
  //       child: Image.asset(
  //         videoImagePath,
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );
  // }
}
