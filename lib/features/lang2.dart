import 'package:flutter/material.dart';

class LanguageSelectionWidget2 extends StatefulWidget {
  @override
  _LanguageSelectionWidget2State createState() => _LanguageSelectionWidget2State();
}

class _LanguageSelectionWidget2State extends State<LanguageSelectionWidget2> {
  String selectedLanguage = 'eng';

  @override
  Widget build(BuildContext context) {
    return _buildLanguageContainer();
  }

  Widget _buildLanguageContainer() {
    return Container(
      padding: const EdgeInsets.all(8),
      
      child: Row(
        children: [
          
          GestureDetector(
            onTap: () {
              _showLanguageSelectionDialog(context);
            },
            child: Container(
              width: 50,
              height: 20,
              decoration: BoxDecoration(
                color: const Color(0xFF7D7CC9),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    selectedLanguage,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  void _showLanguageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageOption('English', 'eng'),
              _buildLanguageOption('Hindi', 'hin'),
              _buildLanguageOption('Marathi', 'mar'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(String languageName, String languageCode) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = languageCode;
        });
       // Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(languageName),
      ),
    );
  }
}
