import 'package:flutter/material.dart';
import 'package:learningapp/screens/homepages/bookmarkpages/bookmark1.dart';
import 'package:learningapp/screens/homepages/buypages/buysubjectpage1.dart';
import 'package:learningapp/screens/homepages/discussionpage/discussion.dart';
import 'package:learningapp/screens/homepages/profilepage/profilepage1.dart';
import 'package:learningapp/screens/homepages/testpages/testpage1.dart';
import 'package:learningapp/screens/startingpages/onboarding.dart';
class SideDrawer extends StatelessWidget {
  final BuildContext context;

  SideDrawer(this.context);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            color: Color(0xFF7D7CC9),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(height: 39),
                  _buildUserRow(),
                  SizedBox(height: 20),
                  _buildIconRow(Icons.bookmark_border, 'Bookmark', () {
                    _handleIconTap('Bookmark');
                  }),
                  _buildIconRow(Icons.message_outlined, 'Discussion Forum', () {
                    _handleIconTap('Discussion Forum');
                  }),
                  _buildIconRow(Icons.my_library_books_outlined, 'Test Series', () {
                    _handleIconTap('Test Series');
                  }),
                  _buildIconRow(Icons.map_outlined, 'Buy Subject', () {
                    _handleIconTap('Buy Subject');
                  }),
                  _buildIconRow(Icons.call, 'Contact Us', () {
                    _handleIconTap('Contact Us');
                  }),
                  _buildIconRow(Icons.share, 'Share With Friend', () {
                    _handleIconTap('Share With Friend');
                  }),
                  //SizedBox(height: 20),
                  _buildLogoutButton(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.6,
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/ob98.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
    child: ElevatedButton(
      onPressed: () {
        _showLogoutDialog(context);
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.all(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.logout, color: Color(0xFF7D7CC9)),
          SizedBox(width: 10),
          Text(
            'Logout',
            style: TextStyle(
              color: Color(0xFF7D7CC9),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}


 void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Logout'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Are you sure you want to quit?'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add your logout logic here
                      // Close the dialog
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => Onboarding()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFF7D7CC9), // Change color here
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFF7D7CC9), // Change color here
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

  Widget _buildUserRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profilepage1()),
          );
        },
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/ob96.png'),
                ),
                SizedBox(width: 10),
                Text(
                  'Your Name',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconRow(IconData icon, String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  void _handleIconTap(String text) {
    switch (text) {
      case 'Bookmark':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Bookmarkpage()),
        );
        break;
      case 'Discussion Forum':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DiscussionPage()),
        );
        break;
      case 'Test Series':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Testpage1()),
        );
        break;
      case 'Buy Subject':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BuySubjectPage()),
        );
        break;
      case 'Contact Us':
        // Navigate to the contact us page
        break;
      case 'Share With Friend':
        // Navigate to the share with friend page
        break;
    }
  }
}
