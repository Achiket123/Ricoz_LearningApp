import 'package:flutter/material.dart';
class NotifyPage2 extends StatefulWidget {
  @override
  _NotifyPage2State createState() => _NotifyPage2State();
}

class _NotifyPage2State extends State<NotifyPage2> {
  Widget buildNotification(String text) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.1,
      color: Color(0xFFF1F1F1),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }

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
                'assets/ob99.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildNotification('New Sample Papers available. Click to solve.'),
                SizedBox(height: 8),
                buildNotification('Upgrade to Premium and enjoy ad-free learning, unlimited access, and more. Limited-time offer.'),
                SizedBox(height: 8),
                buildNotification('There is new discussion in forum.'),
                SizedBox(height: 8),
                buildNotification('Help us improve! Share your feedback on your recent learning experience. We value your input.'),
              ],
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
                              'Notify',
                              style: TextStyle(
                                color: Color(0xFF7D7CC9),
                                fontSize: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
