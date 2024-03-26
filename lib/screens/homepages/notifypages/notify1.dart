import 'package:flutter/material.dart';
import 'package:learningapp/screens/homepages/notifypages/notifypage2.dart';

class NotifyPage1 extends StatefulWidget {
  @override
  _NotifyPage1State createState() => _NotifyPage1State();
}

class _NotifyPage1State extends State<NotifyPage1> {
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotifyPage2()),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Image.asset(
                  'assets/ob80.png',
                  fit: BoxFit.cover,
                ),
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
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08),
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
