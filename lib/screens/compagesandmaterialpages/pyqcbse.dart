import 'package:flutter/material.dart';
import 'package:learningapp/screens/compagesandmaterialpages/downloadnotifypage.dart';
class QuestionPaper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              _buildButtonsRow(context),
              _buildImage(context),
              SizedBox(height: 30.0),
              _buildBottomButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonsRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildButton(context, 'Previous'),
          _buildButton(context, 'Next'),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label) {
    return Container(
      width: 150.0,
      height: 50.0,
       decoration: BoxDecoration(
      border: Border.all(
        color: Color(0xFF7D7CC9), 
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: Color(0xFF7D7CC9)),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/ob83.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDialog(context),
      child: Container(
        width: 150.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Color(0xFF7D7CC9),
           borderRadius: BorderRadius.circular(10.0),
        ),        
        child: Center(
          child: Text(
            'Download',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Show the dialog
      return AlertDialog(
        content: Container(
          height: MediaQuery.of(context).size.width * 0.3,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF7D7CC9),
                ),
                child: const Center(
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 40.0,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                'Downloading your file',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
  await Future.delayed(Duration(seconds: 3));
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => DetailPage()),
  );
}

}
