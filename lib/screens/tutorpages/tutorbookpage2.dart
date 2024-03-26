import 'package:flutter/material.dart';
import 'package:learningapp/screens/compagesandmaterialpages/bookedpage.dart';
import 'package:learningapp/features/shadow.dart';
import 'package:learningapp/features/timepicker.dart';
import 'package:learningapp/features/tutorfeature/togglebutton.dart';
import 'package:learningapp/features/tutorfeature/togglebutton2.dart';
import 'package:learningapp/screens/tutorpages/tutorslotbookpage.dart';
class TutorBookPage2 extends StatefulWidget {
  final String tutorImage;

  TutorBookPage2({required this.tutorImage});
  @override
  _TutorBookPage2State createState() => _TutorBookPage2State();
}

class _TutorBookPage2State extends State<TutorBookPage2> {
  bool isButton1Selected = false;
  bool isButton2Selected = false;
  bool isButton3Selected = false;
  bool isButton4Selected = false;
  bool isButton5Selected = false;
  bool isButton6Selected = false;
  bool isButton7Selected = false;
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  bool isNextButtonEnabled = false;
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != dateOfBirthController) {
      setState(() {
        dateOfBirthController.text = picked.toString();
      });
    }
  }

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
                child: Image.asset(
                  'assets/ob93.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.08),
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
                                'Tutor',
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
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 17),
                      buildToggleButton(
                        context,
                        'Offline Tutor',
                        isButton1Selected,
                        () {
                          setState(() {
                            isButton1Selected = !isButton1Selected;
                            isButton2Selected = false;
                          });
                        },
                      ),
                      SizedBox(width: 20),
                      buildToggleButton(
                        context,
                        'Online Tutor',
                        isButton2Selected,
                        () {
                          setState(() {
                            isButton1Selected = false;
                            isButton2Selected = !isButton2Selected;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 17),
                        buildToggleButton2(
                          context,
                          'Science',
                          isButton3Selected,
                          () {
                            setState(() {
                              isButton3Selected = !isButton3Selected;
                              isButton4Selected = false;
                              isButton5Selected = false;
                              isButton6Selected = false;
                              isButton7Selected = false;
                            });
                          },
                        ),
                        SizedBox(width: 10),
                        buildToggleButton2(
                          context,
                          'Maths',
                          isButton4Selected,
                          () {
                            setState(() {
                              isButton3Selected = false;
                              isButton4Selected = !isButton4Selected;
                              isButton5Selected = false;
                              isButton6Selected = false;
                              isButton7Selected = false;
                            });
                          },
                        ),
                        SizedBox(width: 10),
                        buildToggleButton2(
                          context,
                          'Hindi',
                          isButton5Selected,
                          () {
                            setState(() {
                              isButton3Selected = false;
                              isButton4Selected = false;
                              isButton5Selected = !isButton5Selected;
                              isButton6Selected = false;
                              isButton7Selected = false;
                            });
                          },
                        ),
                        SizedBox(width: 10),
                        buildToggleButton2(
                          context,
                          'English',
                          isButton6Selected,
                          () {
                            setState(() {
                              isButton3Selected = false;
                              isButton4Selected = false;
                              isButton5Selected = false;
                              isButton6Selected = !isButton6Selected;
                              isButton7Selected = false;
                            });
                          },
                        ),
                        SizedBox(width: 10),
                        buildToggleButton2(
                          context,
                          'History',
                          isButton7Selected,
                          () {
                            setState(() {
                              isButton3Selected = false;
                              isButton4Selected = false;
                              isButton5Selected = false;
                              isButton6Selected = false;
                              isButton7Selected = !isButton7Selected;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  MyColoredShadowContainer(),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Center(
                                   child: CircleAvatar(
                                     radius: 60,
                                    // backgroundColor: Colors.blue,
                                     child: Image.asset(
                                       widget.tutorImage, 
                                       fit: BoxFit.cover,
                                       width: 150,
                                       height: 150,
                                     ),
                                   ),
                                 ),
                                 
                   ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, I am Samaira! I am a dedicated and passionate Math tutor with over 7 years of experience helping students grasp the beauty of mathematics. Whether you are struggling with algebra, geometry, or calculus, I am here to guide you through the journey of mastering Math.',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        Divider(color: Colors.grey, height: 1),
                        SizedBox(height: 10),
                        Text(
                          'Subjects I teach: Maths, English',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        Divider(color: Colors.grey, height: 1),
                        SizedBox(height: 10),
                        Text(
                          'Availability:\nI offer flexible tutoring hours to accommodate different time zones and schedules. ',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          _showBookingDialog();
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Color(0xFF7D7CC9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Book Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                           Navigator.push(
                                context,
                                MaterialPageRoute(
                  builder: (context) => TutorSlotBookPage(),
                                ),
                              );
                          //Navigator.pop(context); TutorSlotBookPage
                         
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Color(0xFF7D7CC9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Another Slot',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                 ],
              ),)
          ],
        ),
      ),
    );
  }
   void _showBookingDialog() {
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('ENTER DATE ,TIME ,LOCATION',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(height: 10.0),
                buildFormBox(
                  controller: dateOfBirthController,
                  icon: Icons.calendar_today,
                  hintText: 'Date of Birth',
                ),
                SizedBox(height: 10.0),
                // Divider(
                //   color: Colors.grey[700],
                // ),
                buildFormBox2(
                  controller: timeController,
                  icon: Icons.access_time,
                  hintText: 'Select Time',
                  isTimePicker: true,
                ),
                SizedBox(height: 10.0),
                // Divider(
                //   color: Colors.grey[700],
                // ),
                buildFormBox(
                  controller: locationController,
                  icon: Icons.location_on,
                  hintText: 'Location',
                ),
                SizedBox(height: 10.0),
                // Divider(
                //   color: Colors.grey[700],
                // ),
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF7D7CC9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Bookedpage()),
                      );
                    },
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Widget buildFormBox2({
  required TextEditingController controller,
  required IconData icon,
  required String hintText,
  bool isTimePicker = false,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 2),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Color(0xFFFAFAFA),
     // border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: [
        Icon(icon, color: Color(0xFF7D7CC9)),
        SizedBox(width: 10),
        Container(
          width: 1,
          height: 24,
          color: Colors.grey,
          margin: EdgeInsets.symmetric(horizontal: 5),
        ),
        Expanded(
          child: isTimePicker
              ? TimePickerTextField(
                  onTimeSelected: (selectedTime) {
                    setState(() {
                      timeController.text =
                          '${selectedTime!.format(context)}';
                    });
                  },
                )
              : TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                  ),
                  onTap: () {
                    if (hintText == 'Date of Birth') {
                      _selectDate(context);
                    }
                  },
                  onChanged: (value) {
                 
                  },
                ),
        ),
      ],
    ),
  );
}

  Widget buildFormBox({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.symmetric(horizontal:10),
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
       // border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF7D7CC9)),
          SizedBox(width: 10),
          Container(
            width: 1,
            height: 24,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 5),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
              onTap: () {
                if (hintText == 'Date of Birth') {
                  _selectDate(context);
                }
              },
              onChanged: (value) {
               
              },
            ),
          ),
        ],
      ),
    );
  }

}

