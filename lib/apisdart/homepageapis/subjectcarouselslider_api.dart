import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:learningapp/database/databaseapi.dart';

class SubjectCarousel extends StatefulWidget {
  @override
  _SubjectCarouselState createState() => _SubjectCarouselState();
}

class _SubjectCarouselState extends State<SubjectCarousel> {
  List<dynamic> subjects = [];
  final List<String> staticSubjects = [
    'Science',
    'Maths',
    'Geography',
    'Civics',
    'History',
    'Hindi',
    'English'
  ];
  final List<String> staticImages = [
    'assets/ob66.png',
    'assets/ob67.png',
    'assets/ob67.png',
    'assets/ob69.png',
    'assets/ob70.png',
    'assets/ob71.png',
    'assets/ob72.png',
  ];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(DatabaseApi.usersubject));
    if (response.statusCode == 200) {
      setState(() {
        subjects = json.decode(response.body);
      });
    } else {
      // // Exception('Failed to load subjects');
    }
  }

  Future<void> fetchSubjectData(String subjectName) async {
    final response =
        await http.get(Uri.parse('${DatabaseApi.usersubject}/$subjectName'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data != null && data.isNotEmpty) {
        log('Data for $subjectName: $data');
      } else {
        log('Data not available for $subjectName');
      }
    } else {
      log('Failed to load data for $subjectName');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 155.0,
        enableInfiniteScroll: false,
        viewportFraction: 0.5,
      ),
      items: subjects.isNotEmpty
          ? subjects.map<Widget>((subject) {
              return GestureDetector(
                onTap: () => fetchSubjectData(subject['name']),
                child:
                    _buildCarouselItem(subject['name'], subject['imagePath']),
              );
            }).toList()
          : List.generate(staticSubjects.length, (index) {
              return GestureDetector(
                onTap: () => fetchSubjectData(staticSubjects[index]),
                child: _buildCarouselItem(
                    staticSubjects[index], staticImages[index]),
              );
            }),
    );
  }

  Widget _buildCarouselItem(String text, String imagePath) {
    return Container(
      width: 155.0,
      height: 155.0,
      margin: EdgeInsets.only(left: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: double.infinity,
              height: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
