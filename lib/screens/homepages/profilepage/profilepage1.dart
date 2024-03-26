import 'package:flutter/material.dart';
import 'package:learningapp/screens/homepages/profilepage/profilepage2.dart';
import 'package:learningapp/screens/homepages/profilepage/profilesubscribe.dart';
import 'package:learningapp/screens/homepages/profilepage/profileunscribe.dart';

class Profilepage1 extends StatefulWidget {
  final String phoneText;
  final String dobText;
  final String emailText;
  final String locationText;
  final String courseTypeText;
  final String classText;
  final String tuitionText;
  final String mediumText;

  Profilepage1({
    this.phoneText = '',
    this.dobText = 'Default Date of Birth',
    this.emailText = 'Default Email',
    this.locationText = 'Default Location',
    this.courseTypeText = 'Default Course Type',
    this.classText = 'Default Class',
    this.tuitionText = 'Default Tuition',
    this.mediumText = 'Default Medium',
  });

  @override
  _Profilepage1State createState() => _Profilepage1State();
}

class _Profilepage1State extends State<Profilepage1> {
  int? subscribeValue = 0;
  ProfileData profileData = ProfileData();
  bool switchValue = true;

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

            // Positioned(
            //   top: MediaQuery.of(context).size.height * 0.068,
            //   left: MediaQuery.of(context).size.width * 0.2,
            //   child: Column(
            //     children: [
            //       Image.asset(
            //         'assets/ob45.png',
            //         width: MediaQuery.of(context).size.width * 0.3,
            //         height: MediaQuery.of(context).size.width * 0.3,
            //         fit: BoxFit.cover,
            //       ),
            //       SizedBox(height: 10),
            //       Column(
            //         children: [
            //           SizedBox(height: 10),
            //           Text(
            //             'Lorem Ipsum',
            //             style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 20,
            //             ),
            //           ),
            //         ],
            //       ),
            //       Row(
            //         children: [
            //           Text(
            //             'Parental Code',
            //             style: TextStyle(
            //               color: Colors.grey,
            //               fontSize: 12,
            //             ),
            //           ),
            //           Text(
            //             '-0000',
            //             style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 12,
            //             ),
            //           ),
            //         ],
            //       ),
            //       Row(
            //         children: [
            //           ElevatedButton(
            //             onPressed: () async {
            //               final result = await Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => Profilepage2(
            //                     phoneText: widget.phoneText,
            //                     dobText: widget.dobText,
            //                     emailText: widget.emailText,
            //                     locationText: widget.locationText,
            //                     courseTypeText: widget.courseTypeText,
            //                     classText: widget.classText,
            //                     tuitionText: widget.tuitionText,
            //                     mediumText: widget.mediumText,
            //                     onSaveChanges: (updatedData) {
            //                       setState(() {
            //                         profileData = updatedData;
            //                       });
            //                     },
            //                   ),
            //                 ),
            //               );
            //               if (result != null && result == 1) {
            //                 setState(() {
            //                   subscribeValue = 1;
            //                 });
            //               }
            //             },
            //             style: ElevatedButton.styleFrom(
            //               primary: Colors.purple,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(0),
            //               ),
            //             ),
            //             child: Text('Edit Details', style: TextStyle(color: Colors.white)),
            //           ),
            //           SizedBox(width: 10),
            //           ElevatedButton(
            //             onPressed: () {
            //               if (subscribeValue == 0) {
            //                 Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                         builder: (context) => Profileunsubscribe()));
            //               } else {
            //                 Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                         builder: (context) => Profilesubscribe()));
            //               }
            //             },
            //             style: ElevatedButton.styleFrom(
            //               primary: Colors.purple,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(0),
            //               ),
            //             ),
            //             child: Text('Subscription', style: TextStyle(color: Colors.white)),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // top: MediaQuery.of(context).size.height * 0.4,
            // left: MediaQuery.of(context).size.width * 0.1,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 49),
                Column(
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
                        SizedBox(height: 10),
                        Text(
                          'Lorem Ipsum',
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profilepage2(
                                  phoneText: widget.phoneText,
                                  dobText: widget.dobText,
                                  emailText: widget.emailText,
                                  locationText: widget.locationText,
                                  courseTypeText: widget.courseTypeText,
                                  classText: widget.classText,
                                  tuitionText: widget.tuitionText,
                                  mediumText: widget.mediumText,
                                  onSaveChanges: (updatedData) {
                                    setState(() {
                                      profileData = updatedData;
                                    });
                                  },
                                ),
                              ),
                            );

                            // if (result != null && result == 1) {
                            //   setState(() {
                            //     subscribeValue = 1;
                            //   });
                            // }
                            subscribeValue =
                                0; // modify this part so that u can fetch it's value from backend, not subscribe value 0 else 1
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF7D7CC9),
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
                            if (subscribeValue == 0) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Profileunsubscribe()));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Profilesubscribe()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF7D7CC9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: Text('Subscription',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                _buildTextContainer(
                    'Phone No', profileData.phone, Colors.white),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 4),
                  child: Row(
                    children: [
                      SizedBox(width: MediaQuery.sizeOf(context).width*0.3),
                      Text('Whatsapp notification', style: TextStyle(color: Colors.grey),),
                       Switch(
      value: switchValue,
      onChanged: (bool newValue) {
        
        setState(() {
          switchValue = newValue; 
        });
      },
    ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                _buildTextContainer(
                    'Date of birth', profileData.dob, Colors.white),
                SizedBox(height: 10),
                _buildTextContainer(
                    'Email Id', profileData.email, Colors.white),
                SizedBox(height: 10),
                _buildTextContainer(
                    'Location', profileData.location, Colors.white),
                SizedBox(height: 10),
                _buildTextContainer(
                    'Course Type', profileData.courseType, Colors.white),
                SizedBox(height: 10),
                _buildTextContainer(
                    'Class', profileData.classText, Colors.white),
                SizedBox(height: 10),
                _buildTextContainer(
                    'Tuition', profileData.tuition, Colors.white),
                SizedBox(height: 10),
                _buildTextContainer('Medium', profileData.medium, Colors.white),
                SizedBox(height: 10),
                Container(height: MediaQuery.of(context).size.width * 0.05),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextContainer(String firstText, String secondText, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.18,
        
         decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6.0),
      ),
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              firstText,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              secondText,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileData {
  final String phone;
  final String dob;
  final String email;
  final String location;
  final String courseType;
  final String classText;
  final String tuition;
  final String medium;

  ProfileData({
    this.phone = '',
    this.dob = '',
    this.email = '',
    this.location = '',
    this.courseType = '',
    this.classText = '',
    this.tuition = '',
    this.medium = '',
  });
}
