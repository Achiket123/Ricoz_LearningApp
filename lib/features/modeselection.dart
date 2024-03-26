import 'package:flutter/material.dart';

class buildModeContainer extends StatefulWidget {
  @override
  _buildModeContainerState createState() => _buildModeContainerState();
}

class _buildModeContainerState extends State<buildModeContainer> {
  String selectedMode = 'Online';

  void _showModeSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Mode'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildModeOption('Online'),
              _buildModeOption('Offline'),
              _buildModeOption('Hybrid'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildModeOption(String mode) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMode = mode;
        });
      //  Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(mode),
      ),
    );
  }

  Widget build(BuildContext context) {
    return _buildModeContainer();
  }

  Widget _buildModeContainer() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const Text(
            'Mode',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              _showModeSelectionDialog(context);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF7D7CC9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                selectedMode,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
