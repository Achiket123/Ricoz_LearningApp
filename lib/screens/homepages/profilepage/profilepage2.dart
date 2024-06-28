import 'package:flutter/material.dart';
import 'package:learningapp/screens/homepages/profilepage/profilepage1.dart';

class Profilepage2 extends StatefulWidget {
  final String phoneText;
  final String dobText;
  final String emailText;
  final String locationText;
  final String courseTypeText;
  final String classText;
  final String tuitionText;
  final String mediumText;
  final Function(ProfileData) onSaveChanges;

  Profilepage2({
    this.phoneText = '',
    this.dobText = '',
    this.emailText = '',
    this.locationText = '',
    this.courseTypeText = '',
    this.classText = '',
    this.tuitionText = '',
    this.mediumText = '',
    required this.onSaveChanges,
  });

  @override
  _Profilepage2State createState() => _Profilepage2State();
}

class _Profilepage2State extends State<Profilepage2> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController courseTypeController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController tuitionController = TextEditingController();
  TextEditingController mediumController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneController.text = widget.phoneText;
    dobController.text = widget.dobText;
    emailController.text = widget.emailText;
    locationController.text = widget.locationText;
    courseTypeController.text = widget.courseTypeText;
    classController.text = widget.classText;
    tuitionController.text = widget.tuitionText;
    mediumController.text = widget.mediumText;
  }
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
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Color(0xFF7D7CC9),
                  borderRadius: BorderRadius.only(),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Positioned(
            //   top: MediaQuery.of(context).size.height * 0.068,
            //   left: MediaQuery.of(context).size.width * 0.285,
            //   child:
            // ),
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
                          onPressed: () {
                            // Save changes and pop the page
                            widget.onSaveChanges(ProfileData(
                              phone: phoneController.text,
                              dob: dobController.text,
                              email: emailController.text,
                              location: locationController.text,
                              courseType: courseTypeController.text,
                              classText: classController.text,
                              tuition: tuitionController.text,
                              medium: mediumController.text,
                            ));
                            Navigator.pop(context, 1);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF7D7CC9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: Text('Save Changes',
                              style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                _buildEditableTextContainer(
                    'Phone No', phoneController, Colors.white),
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
                _buildEditableTextContainer(
                    'Date of birth', dobController, Colors.white),
                SizedBox(height: 10),
                _buildEditableTextContainer(
                    'Email Id', emailController, Colors.white),
                SizedBox(height: 10),
                _buildEditableTextContainer(
                    'Location', locationController, Colors.white),
                SizedBox(height: 10),
                _buildEditableTextContainer(
                    'Course Type', courseTypeController, Colors.white),
                SizedBox(height: 10),
                _buildEditableTextContainer(
                    'Class', classController, Colors.white),
                SizedBox(height: 10),
                _buildEditableTextContainer(
                    'Tuition', tuitionController, Colors.white),
                SizedBox(height: 10),
                _buildEditableTextContainer(
                    'Medium', mediumController, Colors.white),
                SizedBox(height: 10),
                Container(height:MediaQuery.of(context).size.width * 0.05 ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableTextContainer(
      String firstText, TextEditingController controller, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:24.0),
      child: Container(
        width: MediaQuery.of(context).size.width ,
        height: MediaQuery.of(context).size.height * 0.12,
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
            TextField(
              controller: controller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
