import 'package:flutter/material.dart';
// import 'package:learningapp/subjectdetailpages.dart';
import 'package:learningapp/features/lang2.dart';
import 'package:learningapp/features/tutorfeature/togglebutton.dart';
import 'package:learningapp/features/videorelatedfeatures.dart';
class ViewMore extends StatefulWidget {
  @override
  _ViewMoreState createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
  bool isButton1Selected = false;
  bool isButton2Selected = false;
  String selectedLanguage = 'eng';
  // final List<String> videoImages = [
  //   'assets/ob13.png',
  //   'assets/ob14.png',
  //   'assets/ob13.png',
  //   'assets/ob14.png',
  //   'assets/ob13.png',
  //   'assets/ob14.png',
  //   'assets/ob13.png',
  //   'assets/ob14.png',
  // ];

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
                  'assets/ob89.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
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
                              'Science ',
                              style: TextStyle(
                                  color: Color(0xFF7D7CC9), fontSize: 24.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Chapter 1- Chemical Reaction & Equations ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      buildToggleButton(
                        context,
                        'NCERT lesson',
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
                        'NCERT sol.',
                        isButton2Selected,
                        () {
                          setState(() {
                            isButton1Selected = false;
                            isButton2Selected = !isButton2Selected;
                          });
                        },
                      ),
                      Spacer(),
                     LanguageSelectionWidget2(),
                    ],
                  ),
                  SizedBox(height: 30),
                  buildSectionTitle("All Videos"),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(
      String text, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.18,
        height: MediaQuery.of(context).size.width * 0.08,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Color(0xFF7D7CC9) : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Color(0xFF7D7CC9): Colors.black,
            ),
          ),
        ),
      ),
    );
  }

//   Widget _buildSectionTitle(String title) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         title,
//         style: TextStyle(
//           fontSize: 20.0,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       SizedBox(height: 16),
//       GridView.builder(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 8.0,
//           mainAxisSpacing: 8.0,
//           childAspectRatio: 8/5,
//         ),
//         itemCount: videoImages.length,
//         itemBuilder: (BuildContext context, int index) {
//           return _buildClickableImageContainer(videoImages[index]);
//         },
//       ),
//     ],
//   );
// }


//  Widget _buildClickableImageContainer(String imagePath) {
//   return GestureDetector(
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => DetailPage(imagePath: imagePath),
//         ),
//       );
//     },
//     child: ClipRRect(
//       borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.45,
//         height: MediaQuery.of(context).size.width * 0.35,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//         ),
//         child: Image.asset(
//           imagePath,
//           fit: BoxFit.cover,
//           width: double.infinity,
//           height: double.infinity,
//         ),
//       ),
//     ),
//   );
// }
}