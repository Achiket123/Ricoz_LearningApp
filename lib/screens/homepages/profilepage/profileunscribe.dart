import 'package:flutter/material.dart';
import 'package:learningapp/screens/homepages/profilepage/profilepage2.dart';
import 'package:learningapp/screens/homepages/profilepage/profilesubscribe.dart';
class Profileunsubscribe extends StatefulWidget {
  @override
  _ProfileunsubscribeState createState() => _ProfileunsubscribeState();
}

class _ProfileunsubscribeState extends State<Profileunsubscribe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/ob44.png',
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
              alignment: Alignment.topRight,
            ),
          ),
          Positioned(
            top: 49,
            left: 28,
            child: GestureDetector(
              onTap: () {
                    Navigator.pop(context);
                  },
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Color(0xFF7D7CC9),
                  borderRadius: BorderRadius.only(),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.068,
            left: MediaQuery.of(context).size.width * 0.15,
            child: Column(
              children: [
                Image.asset(
                  'assets/ob45.png',
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Loreum Ipsum',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Parental Code',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '-0000',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profilepage2(  onSaveChanges: (updatedData) {
                      // Handle updated data as needed
                      print('Updated data: $updatedData');
                    },),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF7D7CC9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Text('Edit Details', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profileunsubscribe(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF7D7CC9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Text('Subscription ', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5 + MediaQuery.of(context).size.width * 0.1,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.34,
                  height: MediaQuery.of(context).size.width * 0.34,
                  child: Image.asset(
                    'assets/ob50.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'You have not yet subscribed \nto any of the courses',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                 onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profilesubscribe(),
                    ),
                  );
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7D7CC9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text('Subscribe', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}