import 'package:flutter/material.dart';
import 'package:learningapp/screens/homepages/profilepage/profilepage2.dart';
import 'package:learningapp/features/language.dart';
import 'package:learningapp/features/modeselection.dart';
import 'package:learningapp/features/timetable.dart';

class Profilesubscribe extends StatefulWidget {
  @override
  _ProfilesubscribeState createState() => _ProfilesubscribeState();
}

class _ProfilesubscribeState extends State<Profilesubscribe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Stack(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 49),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profilepage2(
                              onSaveChanges: (updatedData) {
                                print('Updated data: $updatedData');
                              },
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF7D7CC9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Text('Edit Details',
                          style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 10),
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
                      child: Text(
                        'Subscription',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:28.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Personalized Courses',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '-Master Class',
                                style: TextStyle(
                                  color: Color(0xFF7D7CC9),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'RS. XXX',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Selected Subject',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                         // SizedBox(height: 10),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.15,
                                height: MediaQuery.of(context).size.width * 0.15,
                                
                                child: Image.asset('assets/ob105.png',
                                    fit: BoxFit
                                        .cover),
                              ),
                              SizedBox(width: 4),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.15,
                                height: MediaQuery.of(context).size.width * 0.15,
                                
                                child: Image.asset('assets/ob106.png',
                                    fit: BoxFit
                                        .cover), 
                              ),
                            ],
                          ),
                          SizedBox(height: 18),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                              
                               
                                children: [
                                  //SizedBox(width: 10),
                                  Row(
                                    children: [
                                      // Text("Language",style: TextStyle(fontWeight: FontWeight.bold),),
                                      LanguageSelectionWidget(),
                                    ],
                                  ),
                                ],
                              ),
                               SizedBox(height: 10),
                          Row(
                            
                            children: [
                              //SizedBox(width: 30),
                              buildModeContainer(),
                            ],
                          ),
                            ],
                          ),
                         
                          Column(
                           
                            children: [
                              Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Time table',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildTimeTable(),
                            ],
                          ),
                          Container(height:MediaQuery.of(context).size.width * 0.08 ),
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
