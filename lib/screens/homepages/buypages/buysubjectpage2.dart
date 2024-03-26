import 'package:flutter/material.dart';
import 'package:learningapp/screens/homepages/buypages/payment1.dart';
import 'package:learningapp/features/timetable.dart';
import 'package:learningapp/features/language.dart';
import 'package:learningapp/features/modeselection.dart';
class BuySubjectPage2 extends StatefulWidget {
  @override
  _BuySubjectPage2State createState() => _BuySubjectPage2State();
}
class _BuySubjectPage2State extends State<BuySubjectPage2> {
  Set<int> selectedContainerIndices = {};
  int selectedClass = 10;
  String selectedMode = 'Online';
  int? selectedContainerIndex;
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
                  'assets/ob86.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAppBar(),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Select Subject',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildSubjectImages(),
                  _buildLanguageAndModeContainers(),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Time table',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: buildTimeTable(),
                  ),
                  const SizedBox(height: 40),
                  _buildCoursePlan(),
                   const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(
                        context );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                color: const Color(0xFF7D7CC9),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24.0),
                  const Text(
                    'Buy Subject',
                    style: TextStyle(color: Color(0xFF7D7CC9), fontSize: 24.0),
                  ),
                  const SizedBox(height: 12.0),
                  GestureDetector(
                    onTap: () {
                      _showClassSelectionDialog(context);
                    },
                    child: Row(
                      children: [
                        Text(
                          'Class $selectedClass',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18.0),
                        ),
                        const SizedBox(width: 10),
                        const Text('change',
                            style: TextStyle(color: Color(0xFF7D7CC9))),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildSubjectImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 37; i <= 41; i++)
          Container(
            width: MediaQuery.of(context).size.width * 0.16,
            height: MediaQuery.of(context).size.width * 0.2,
            child: Image.asset(
              'assets/ob$i.png',
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }
  Widget _buildLanguageAndModeContainers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LanguageSelectionWidget(),
        buildModeContainer(),
      ],
    );
  }
  Widget _buildCoursePlan() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Course Plan',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCourseContainer(0, Colors.white, 'Basic Learning Plan'),
            _buildCourseContainer(1, Colors.white, 'Master Learning Plan'),
          ],
        ),
      ],
    );
  }
  Widget _buildCourseContainer(
      int index, Color containerColor, String heading) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedContainerIndex = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
          color: containerColor,
          border: Border.all(
            color: selectedContainerIndex == index
                ? const Color(0xFF7D7CC9)
                : Colors.grey,
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    heading,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF7D7CC9),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    color: Color(0xFF7D7CC9),
                    thickness: 2.0,
                    height: 16.0,
                  ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
            Column(
              children: [
                _buildCheckBox('Live Teacher Interaction'),
                _buildCheckBox('in-class doubt solving'),
                _buildCheckBox('previous year question'),
                _buildCheckBox('quizzes and leaderboard'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage1()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  color: const Color(0xFF7D7CC9),
                  padding: const EdgeInsets.all(8),
                  child: const Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildCheckBox(String text) {
    return Row(
      children: [
        Container(
          width: 24.0,
          height: 24.0,
          decoration: BoxDecoration(
            color: const Color(0xFF7D7CC9),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: const Center(
            child: Icon(
              Icons.check,
              size: 18.0,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
  void _showClassSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Class'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              12,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedClass = index + 1;
                  });
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Class ${index + 1}'),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
