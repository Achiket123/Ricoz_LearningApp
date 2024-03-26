import 'package:flutter/material.dart';
//import 'package:learningapp/readingmaterialsolution.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:learningapp/readingmanualrad.dart';
import 'package:learningapp/screens/subjectpages/readmanualandrealtedpages/readingmaterialvideos.dart';
import 'package:learningapp/features/shadow.dart';
import 'package:learningapp/features/quizfeature.dart';
class Readmaterial extends StatefulWidget {
  @override
  _ReadmaterialState createState() => _ReadmaterialState();
}

class _ReadmaterialState extends State<Readmaterial> {
  TextEditingController _searchController = TextEditingController();
  bool _isSearchBarEmpty = true;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _isSearchBarEmpty = _searchController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Do something with the image file
      return;
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
                  'assets/ob89.png',
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
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                     onTap: () {
                        Navigator.pop(context);
                        },
                      child: Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.08),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
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
                                  'Science ',
                                  style: TextStyle(
                                    color: Color(0xFF7D7CC9),
                                    fontSize: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Chapter 1- Chemical Reaction & Equations ',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  MyColoredShadowContainer(),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildSectionTitle('What are Acids, Bases, and Salts?'),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Many acids and bases occur naturally in nature, such as citric acid in fruits like orange, lemon, etc, tartaric acid in tamarind, malic acid in apples, and lactic acid in milk and milk products, hydrochloric acid in gastric juices.Similarly, many bases are found such as lime water. We use many of these acids in our day-to-day life, such as vinegar or acetic acid in the kitchen, boric acid for laundry, baking soda for the purpose of cooking, washing soda for cleaning, etc. ',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset(
                              'assets/ob75.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        _buildSectionTitle('Quizzz'),
                        SizedBox(height: 10),
                        buildQuiz(context),
                        SizedBox(height: 30),
                        _buildSectionTitle("Question Desk"),
                        SizedBox(height: 20),
                        _buildContainerWithText(
                          context,
                          "Q.1. Which of the following is a characteristic property of an acid\n A.?",
                        ),
                        SizedBox(height: 10),
                        _buildContainerWithText(
                          context,
                          "Q.2. Which of the following is a characteristic property of an acid?\n A.",
                        ),
                        SizedBox(height: 10),
                        _buildContainerWithText(
                          context,
                          "Q.3. Which of the following is a characteristic property of an acid?\n A.",
                        ),
                        SizedBox(height: 30),
                        _buildSearchBar2(),
                        SizedBox(height: 30),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: _buildSendButton(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(height:MediaQuery.of(context).size.width * 0.05 ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildSearchBar2() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Icon(Icons.search,color: Color(0xFF7D7CC9),),
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Ask.',
                ),
              ),
            ),
            IconButton(
              icon:  Icon(Icons.camera_alt_outlined,color: Color(0xFF7D7CC9)),
              onPressed: () {
                _openCamera(); // Open camera on button click
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainerWithText(BuildContext context, String text) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSendButton() {
    return GestureDetector(
      onTap: () {
        // Navigate to a different page when clicked
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Readingmaterialvideo(),
          ),
        );
      },
      child: Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: _isSearchBarEmpty ? Colors.grey : Color(0xFF7D7CC9),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            'Send',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
