import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class buildRatingSection extends StatefulWidget {
  @override
  _buildRatingSectionState createState() => _buildRatingSectionState();
}

class _buildRatingSectionState extends State<buildRatingSection> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF1F1F1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/ob33.png',
            width: MediaQuery.of(context).size.height * 0.09,
            height: MediaQuery.of(context).size.height * 0.09,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Would you rate us',
                  style: TextStyle(
                    color: Color(0xFF7D7CC9),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: RatingBar.builder(
                  initialRating: rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star_border,
                    color: Color(0xFF7D7CC9), // Star border color
                    size: 30.0,
                  ),
                  onRatingUpdate: (newRating) {
                    setState(() {
                      rating = newRating;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
