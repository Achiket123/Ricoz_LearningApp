import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:learningapp/database/databaseapi.dart';

class BuildRatingSection extends StatefulWidget {
  @override
  _BuildRatingSectionState createState() => _BuildRatingSectionState();
}

class _BuildRatingSectionState extends State<BuildRatingSection> {
  double rating = 0.0;

  // Function to submit rating to the server
  Future<void> submitRating(double rating) async {
    final url =Uri.parse('${DatabaseApi.baseUrl}/give/rating');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'rating': rating}),
      );

      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 201) {
        // Successfully submitted rating
        final responseData = json.decode(response.body);
        log('Rating submitted: ${responseData['message']}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Thank you for your rating!')),
        );
      } else {
        try {
          final responseData = json.decode(response.body);
          log('Failed to submit rating: ${responseData['message']}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${responseData['message']}')),
          );
        } catch (e) {
          log('Failed to submit rating. Status code: ${response.statusCode}, Response body: ${response.body}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error submitting rating. Please try again later.')),
          );
        }
      }
    } catch (error) {
      log('Error submitting rating: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error submitting rating. Please try again later.')),
      );
    }
  }

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
                    log('Number of stars selected: $newRating');
                    submitRating(newRating);
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