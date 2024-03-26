import 'package:flutter/material.dart';
import 'package:learningapp/screens/homepages/quizpages/quizpage2.dart';
// import 'package:google_fonts/google_fonts.dart'; 
class Quizpage extends StatefulWidget {
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  int selectedBoxIndex = -1;

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor:Color(0xFF7D7CC9) ,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Are you ready to put your knowledge to the test?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
              decoration: BoxDecoration(
                color: Color(0xFF7D7CC9),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
            builder: (context) => QuizPage2(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Start Quiz',
                    style: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
                    ),
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
  final List<String> imagePaths = [
    'assets/ob6.png',
    'assets/ob7.png',
    'assets/ob8.png',
    'assets/ob9.png',
    'assets/ob10.png',
    'assets/ob11.png',
    'assets/ob12.png',

  ];

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
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.19,
                child: Image.asset(
                  'assets/ob3.png', 
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:  MediaQuery.of(context).size.height * 0.08),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {
                       Navigator.pop(
                        context );
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            color:Color(0xFF7D7CC9),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Quizzz',
                            style:
                                TextStyle(color:Color(0xFF7D7CC9), fontSize: 24.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                 SizedBox(height: 40),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 8 / 4,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                           showAlertDialog(context);
                         
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => QuizPage2 (),
                          //   ),
                          // );
                        },
                        child: Container(
                          child: Image.asset(
                            imagePaths[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    itemCount: imagePaths.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
