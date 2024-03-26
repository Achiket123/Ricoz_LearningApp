import 'package:flutter/material.dart';

class MyColoredShadowContainer extends StatelessWidget {
  static const Color shadowColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return _buildContainer(context);
  }

  Widget _buildContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.5),
           // spreadRadius: 3,
           // blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      height: 1,
      width: MediaQuery.of(context).size.width,
      //child: _buildText(),
    );
  }
}
