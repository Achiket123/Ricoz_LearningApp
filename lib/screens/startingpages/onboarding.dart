import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:learningapp/screens/startingpages/login.dart';
// import 'package:google_fonts/google_fonts.dart'; 
class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  final List<Map<String, String>> pages = [
    {
      'image': 'assets/ob84.png',
      'text1': 'Welcome to Name',
      'text2': 'Empower your learning journey with a blend\n '
          '      of online convenience and offline \n  '
          '                  expertise',
    },
    {
      'image': 'assets/ob81.png',
      'text1': 'Parental Monitoring',
      'text2': '  Stay informed and engaged in your children\n'
          '         education journey with our\n'
          '              Parental Monitoring\n'
          '                     feature',
    },
    {
      'image': 'assets/ob82.png',
      'text1': 'Connects With Tutors',
      'text2': 'Easily connect with expert tutors for\n  '
          '     online sessions or find local \n '
          '     tutors for  in-person learning.\n'
          '      Your education, your choice',
    },
  ];

  final double maxImageWidth = 400; 
  final double maxImageHeight = 400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return buildPage(index);
            },
          ),
          Positioned(
            top: 30,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  handleOnboardingButtonPress();
                },
                child: Text(
                  _currentPage == pages.length - 1 ? 'Get Started' : 'Skip',
                  style: TextStyle(
                    color: getAvatarColor(_currentPage),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(int index) {
    Color avatarBackgroundColor;

    switch (index) {
      case 0:
        avatarBackgroundColor = Colors.purple;
        break;
      case 1:
        avatarBackgroundColor = Colors.pink;
        break;
      case 2:
        avatarBackgroundColor = Colors.blue;
        break;
      default:
        avatarBackgroundColor = Colors.purple;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:50.0),
          child: Image.asset(
            pages[index]['image']!,
           fit: BoxFit.cover,
           width: MediaQuery.sizeOf(context).width,
          ),
        ),
        SizedBox(height: 20),
        Text(
          pages[index]['text1']!,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          height: 100,
          child: SingleChildScrollView(
            child: Text(
              pages[index]['text2']!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
        ),
        SizedBox(height: 20),
        CircleAvatar(
          backgroundColor: avatarBackgroundColor,
          radius: 30,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 26,
            child: CircleAvatar(
              backgroundColor: avatarBackgroundColor,
              radius: 23,
              child: Text(
                (index + 1).toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void handleOnboardingButtonPress() {
    if (_currentPage < pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  Color getAvatarColor(int index) {
    switch (index) {
      case 0:
        return Colors.purple;
      case 1:
        return Colors.pink;
      case 2:
        return Colors.blue;
      default:
        return Colors.purple;
    }
  }
}
