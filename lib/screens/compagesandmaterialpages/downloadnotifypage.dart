import 'package:flutter/material.dart';
import 'package:learningapp/screens/resourcespage/resource.dart';
class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: DetailWidget(),
      ),
    );
  }
}

class DetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  width: 180.0, 
                  height: 200.0, 
                  
                  child: Image.asset(
                    'assets/ob85.png', 
                    fit: BoxFit.cover,
                  ),
                ),
                 Text(
              'Congratulations! Your knowledge boost has been successfully downloaded',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
            width: 150.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Color(0xFF7D7CC9),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Resourcepage()),
                );
                },
                child: Text(
                  'Go To Resource',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
              ],
            ),
          ),
          SizedBox(height: 20.0), 
          
         
          SizedBox(height: 20.0),
         
          
        ],
      ),
    );
  }
}
