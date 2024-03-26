import 'package:flutter/material.dart';

Widget buildSearchBar() {
  return Container(
    decoration: BoxDecoration(
    //  border: Border.all(color: Colors.grey),
    color: Color(0xFFF1F1F1),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Icon(Icons.search,color: Color(0xFF7D7CC9),),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
              ),
            ),
          ),
           Icon(Icons.camera_alt_outlined,color: Color(0xFF7D7CC9)),
        ],
      ),
    ),
  );
}
