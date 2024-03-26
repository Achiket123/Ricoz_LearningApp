import 'package:flutter/material.dart';
import 'package:learningapp/screens/subjectpages/readmanualandrealtedpages/readingmaterialpage.dart';

Widget buildVideoRow(BuildContext context, List<String> images) {
  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      childAspectRatio: 8/5,
    ),
    itemCount: images.length,
    itemBuilder: (BuildContext context, int index) {
      return _buildVideoBox(context, images[index]);
    },
  );
}

Widget _buildVideoBox(BuildContext context, String imagePath) {
  return GestureDetector(
    onTap: () {
      // Replace 'YourPage()' with the page you want to navigate to
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Readmaterial()));
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16.0), // Adjust the radius as needed
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    ),
  );
}
