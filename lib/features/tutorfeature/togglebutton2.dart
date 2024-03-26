 import 'package:flutter/material.dart';
 Widget buildToggleButton2(BuildContext context, text, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.15,
        height: MediaQuery.of(context).size.width * 0.075,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Color(0xFF7D7CC9) : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Color(0xFF7D7CC9) : Colors.black,
            ),
          ),
        ),
      ),
    );
  }