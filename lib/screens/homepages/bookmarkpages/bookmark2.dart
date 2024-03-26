import 'package:flutter/material.dart';
import 'package:learningapp/features/pyqdownload.dart';
import 'package:learningapp/features/videorow.dart';
class Bookmarkpage2 extends StatelessWidget {
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
                  'assets/ob87.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBackButton(context),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                  _buildSectionTitle('All Videos'),
                  buildVideoRow(
                      context, ['assets/ob111.png', 'assets/ob110.png']),
                  _buildSectionTitle('Reading Manual'),
                  buildVideoRow(
                      context, ['assets/ob111.png', 'assets/ob110.png']),
                      const SizedBox(height: 4),
                  buildVideoRow(
                      context, ['assets/ob110.png', 'assets/ob111.png']),
                  _buildSectionTitle('Textbook'),
                  _buildTextbookRow(
                      context,
                      ['assets/ob15.png', 'assets/ob16.png', 'assets/ob15.png'],
                      ['SL Arora', 'HC Verma ', 'RD Sharma']),
                  _buildSectionTitle('Sample Paper'),
                  _buildSamplePaperRow(
                      context,
                      ['assets/ob17.png', 'assets/ob18.png', 'assets/ob17.png'],
                      ['Year 2023', 'Year 2022', 'Year 2021']),
                  _buildSectionTitle('Past Year Question Paper'),
                  Column(
                    children: [
                      Row(
                        children: [
                          buildYearQuestionRow(context, ['2022']),
                          buildYearQuestionRow(context, ['2021']),
                        ],
                      ),
                      Row(
                        children: [
                          buildYearQuestionRow(context, ['2020']),
                          buildYearQuestionRow(context, ['2019']),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  _buildSectionTitle('Notes'),
                  _buildNotesRow(
                      context,
                      ['assets/ob19.png', 'assets/ob20.png', 'assets/ob21.png'],
                      ['Formula', 'Trigono Glance', 'Algebra']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
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
                  color: const Color(0xFF7D7CC9),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Bookmark',
                  style: TextStyle(color: Color(0xFF7D7CC9), fontSize: 24.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

 
  Widget _buildTextbookRow(
      BuildContext context, List<String> images, List<String> bookNames) {
    assert(images.length == bookNames.length);

    return Row(
      children: List.generate(images.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildTextbookBox(context, images[index], bookNames[index]),
        );
      }),
    );
  }

  Widget _buildSamplePaperRow(
      BuildContext context, List<String> images, List<String> paperNames) {
    assert(images.length == paperNames.length);

    return Row(
      children: List.generate(images.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              _buildSamplePaperBox(context, images[index], paperNames[index]),
        );
      }),
    );
  }

  

  Widget _buildNotesRow(
      BuildContext context, List<String> images, List<String> bookNames) {
    assert(images.length == bookNames.length);

    return Row(
      children: List.generate(images.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildNotesBox(context, images[index], bookNames[index]),
        );
      }),
    );
  }

 

  Widget _buildTextbookBox(
      BuildContext context, String imagePath, String bookName) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.width * 0.33,
      child: Column(
        children: [
          Image.asset(imagePath, fit: BoxFit.cover),
          const SizedBox(height: 8.0),
          Text(
            bookName,
            style: const TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSamplePaperBox(
      BuildContext context, String imagePath, String paperName) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.width * 0.33,
      child: Column(
        children: [
          Image.asset(imagePath, fit: BoxFit.cover),
          const SizedBox(height: 8.0),
          Text(
            paperName,
            style: const TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

 

  Widget _buildNotesBox(
      BuildContext context, String imagePath, String bookName) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.width * 0.33,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        const SizedBox(height: 8.0),
        Text(
          bookName,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  
}
