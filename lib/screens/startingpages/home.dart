import 'package:flutter/material.dart';
import 'package:learningapp/screens/startingpages/courselection.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedClass;
  bool isNextButtonEnabled = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != dateOfBirthController.text) {
      setState(() {
        dateOfBirthController.text = picked.toString();
        checkFormCompletion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(children: [
            Image.asset(
              'assets/ob53.png',
              height: MediaQuery.of(context).size.height * 0.277,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 40,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  color: Colors.grey,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                buildFormBox(
                  controller: nameController,
                  icon: Icons.person,
                  hintText: 'Name',
                ),
                buildFormBox(
                  controller: dateOfBirthController,
                  icon: Icons.calendar_today,
                  hintText: 'Date of Birth',
                ),
                buildFormBox(
                  controller: emailController,
                  icon: Icons.email,
                  hintText: 'Email ID',
                ),
                buildFormBoxWithDropdown(),
                buildFormBox(
                  controller: locationController,
                  icon: Icons.location_on,
                  hintText: 'Location',
                ),
                const SizedBox(height: 40),
                buildNextButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFormBox({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
  }) {
    return Container(
      height: 55.0,
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF7D7CC9), size: 20),
          const SizedBox(width: 10),
          Container(
            width: 1,
            height: 20,
            color: Colors.grey,
            margin: const EdgeInsets.symmetric(horizontal: 5),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                isDense: true,
                hintText: hintText,
                border: InputBorder.none,
              ),
              onTap: () {
                if (hintText == 'Date of Birth') {
                  _selectDate(context);
                }
              },
              onChanged: (value) {
                checkFormCompletion();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFormBoxWithDropdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 55,
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            decoration: BoxDecoration(
              color: Color(0xFFF1F1F1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 45,
                  height: 24,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.book, color: Color(0xFF7D7CC9)),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(text: selectedClass),
                    decoration: InputDecoration(
                      hintText: 'Select Class',
                      border: InputBorder.none,
                    ),
                    readOnly: true,
                    onTap: () {
                      _showClassSelectionDialog(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  void _showClassSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Class'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 1; i <= 10; i++)
                  ListTile(
                    title: Text(i.toString()),
                    onTap: () {
                      setState(() {
                        selectedClass = i.toString();
                        checkFormCompletion();
                      });
                      Navigator.of(context).pop();
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void checkFormCompletion() {
    setState(() {
      isNextButtonEnabled = (isFieldFilled(nameController.text) &&
          isFieldFilled(dateOfBirthController.text) &&
          isFieldFilled(emailController.text) &&
          isFieldFilled(selectedClass) &&
          isFieldFilled(locationController.text));
    });
  }

  bool isFieldFilled(String? value) {
    return value != null && value.isNotEmpty;
  }

  Widget buildNextButton(BuildContext context) {
    return ElevatedButton(
      onPressed: isNextButtonEnabled
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseSelectionPage(
                    name: nameController.text,
                    dob: dateOfBirthController.text,
                    email: emailController.text,
                    selectedClass: selectedClass!,
                    location: locationController.text,
                  ),
                ),
              );
            }
          : null,
      child: const Text(
        'Next',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        textStyle: const TextStyle(color: Colors.white),
        backgroundColor:
            isNextButtonEnabled ? const Color(0xFF7D7CC9) : Colors.grey,
      ),
    );
  }
}
