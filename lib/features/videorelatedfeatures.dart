 import 'package:flutter/material.dart';
 import 'package:learningapp/screens/subjectpages/subjectpage2relatedpages/subjectdetailpages.dart';
final List<String> videoImages = [
    'assets/ob110.png',
    'assets/ob111.png',
    'assets/ob110.png',
    'assets/ob111.png',
    'assets/ob110.png',
    'assets/ob111.png',
    'assets/ob110.png',
    'assets/ob111.png',
  ];

 Widget buildSectionTitle(String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 16),
      GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 8/5,
        ),
        itemCount: videoImages.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildClickableImageContainer(videoImages[index],context);
        },
      ),
    ],
  );
}


 Widget _buildClickableImageContainer(String imagePath,context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(imagePath: imagePath),
        ),
      );
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    ),
  );
}