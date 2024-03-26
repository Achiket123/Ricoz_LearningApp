import 'package:flutter/material.dart';
import 'package:learningapp/features/lang2.dart';

class Testseriespage2 extends StatefulWidget {
  final int timeTaken;
  final Map<int, String?> selectedOptions;

  Testseriespage2({
    required this.timeTaken,
    required this.selectedOptions,
  });

  @override
  _Testseriespage2State createState() => _Testseriespage2State();
}

class _Testseriespage2State extends State<Testseriespage2> {
  bool startWithTimer = false;
  Color correctBorderColor = Colors.green;
  Color incorrectBorderColor = Colors.red;

  int calculateCorrectAnswers() {
    int correctCount = 0;
    for (int i = 1; i <= 3; i++) {
      if (widget.selectedOptions[i] != null) {
        bool hasGreenBorder = false;

        
        if (i == 1) {
          hasGreenBorder = widget.selectedOptions[i] == '14';
        } else if (i == 2) {
          hasGreenBorder = widget.selectedOptions[i] == '23';
        } else if (i == 3) {
          hasGreenBorder = widget.selectedOptions[i] == '34';
        }

        if (hasGreenBorder) {
          correctCount++;
        }
      }
    }
    return correctCount;
  }

  @override
  Widget build(BuildContext context) {
    int correctAnswers = calculateCorrectAnswers();

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
                  'assets/ob100.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                child: CircleAvatar(
                  backgroundColor: correctBorderColor,
                  radius: 50,
                  child: CircleAvatar(
                   // backgroundColor: Colors.white,
                    radius: 45,
                    child: Text(
                      '$correctAnswers/3',
                      style: TextStyle(
                        color: correctBorderColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
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
                          'Quizzz',
                          style: TextStyle(
                              color: Color(0xFF7D7CC9), fontSize: 24.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Switch(
                            value: startWithTimer,
                            onChanged: (value) {
                              setState(() {
                                startWithTimer = value;
                              });
                            },
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Start with timer',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(width: 16),
                          if (startWithTimer)
                            Text(
                              widget.timeTaken.toString(),
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.red),
                            ),
                        ],
                      ),
                      SizedBox(height: 8),
                      LanguageSelectionWidget2(), 
                      SizedBox(height: 16),
                      
                      Text(
                        'Q.1. Which of the following is a characteristic property of an acid?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      
                      buildAnswerBox(
                        'A. Bitter Taste',
                        borderColor: widget.selectedOptions[1] == '11'
                            ? incorrectBorderColor
                            : Colors.grey,
                      ),
                      buildAnswerBox(
                        'B. Turns Red litmus Blue',
                        borderColor: widget.selectedOptions[1] == '12'
                            ? incorrectBorderColor
                            : Colors.grey,
                      ),
                      buildAnswerBox(
                        'C. Feels Soft to touch',
                        borderColor: widget.selectedOptions[1] == '13'
                            ? incorrectBorderColor
                            : Colors.grey,
                      ),
                      buildAnswerBox(
                        'D. Produces H+ ion',
                        borderColor: widget.selectedOptions[1] == '14'
                            ? correctBorderColor
                            : Colors.grey,
                      ), 
                      buildAnswerBoxWithExplanation(
                        context,
                        'Acids are substances that release hydrogen ions (H⁺) when dissolved in water. \n This property is what gives acids their sour taste and their ability to turn blue litmus paper red. \n The other options mentioned are characteristic properties of bases (bitter taste, turns red litmus paper blue) or salts (feels slippery to touch).',
                      ),
                      SizedBox(height: 16),
                      
                      Text(
                        'Q.2. When an acid reacts with a metal, which gas is usually evolved?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      
                      buildAnswerBox(
                        'A. O2',
                        borderColor: widget.selectedOptions[2] == '21'
                            ? incorrectBorderColor
                            : Colors.grey,
                      ),
                      buildAnswerBox(
                        'B.CO2',
                        borderColor: widget.selectedOptions[2] == '22'
                            ? incorrectBorderColor
                            : Colors.grey,
                      ),
                      buildAnswerBox(
                        'C.H2',
                        borderColor: widget.selectedOptions[2] == '23'
                            ? correctBorderColor
                            : Colors.grey,
                      ),
                      buildAnswerBox(
                        'D. N2',
                        borderColor: widget.selectedOptions[2] == '24'
                            ? incorrectBorderColor
                            : Colors.grey,
                      ),
                      buildAnswerBoxWithExplanation(
                        context,
                        'When an acid reacts with a metal, it often produces hydrogen gas (H₂) along with a corresponding salt.\n This reaction is a classic example of a displacement reaction where the more reactive hydrogen displaces the metal from the acid.\nThe other gases mentioned (O₂, CO₂, N₂) are not typically evolved in this context.',
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Q.3. Which of the following is a characteristic property of an acid?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      
                      buildAnswerBox(
                        'A. Bitter Taste',
                        borderColor: widget.selectedOptions[3] == '31'
                            ? incorrectBorderColor
                            : Colors.grey,
                      ),
                      buildAnswerBox(
                        'B. Turns Red litmus Blue',
                        borderColor: widget.selectedOptions[3] == '32'
                            ? incorrectBorderColor
                            : Colors.grey,
                      ),
                      buildAnswerBox(
                        'C. Feels Soft to touch',
                        borderColor: widget.selectedOptions[3] == '33'
                            ? incorrectBorderColor
                            : Colors.grey,
                      ),
                      buildAnswerBox(
                        'D. Produces H+ ion',
                        borderColor: widget.selectedOptions[3] == '34'
                            ? correctBorderColor
                            : Colors.grey,
                      ),
                      buildAnswerBoxWithExplanation(
                        context,
                        'Acids are substances that release hydrogen ions (H⁺) when dissolved in water. \n This property is what gives acids their sour taste and their ability to turn blue litmus paper red. \n The other options mentioned are characteristic properties of bases (bitter taste, turns red litmus paper blue) or salts (feels slippery to touch).',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAnswerBox(String answer, {Color borderColor = Colors.grey}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        answer,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget buildAnswerBoxWithExplanation(
      BuildContext context, String explanation) {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              'Explanation',
              style: TextStyle(
                color: Color(0xFF7D7CC9),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  child: Text(
                    explanation,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
