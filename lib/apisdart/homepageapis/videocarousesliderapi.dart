import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:learningapp/database/databaseapi.dart';
import 'dart:convert';
import 'package:learningapp/models/homepage/videocarouselmodel.dart';
import 'package:learningapp/apisdart/otp_api.dart';
class VideoCarousel extends StatefulWidget {
  @override
  _VideoCarouselState createState() => _VideoCarouselState();
}

class _VideoCarouselState extends State<VideoCarousel> {
  List<Video> videos = [];
  bool isLoading = true;

  final List<String> videoImages = [
    'assets/ob13.png',
    'assets/ob108.png',
    'assets/ob13.png',
    'assets/ob108.png',
  ];

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    final response = await http.get(
      Uri.parse(DatabaseApi.Gethistory), 
      headers: {
        'Authorization': 'Bearer ${OtpApi.token}', // Replace with your auth token if needed
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        videos = data.map((json) => Video.fromJson(json)).toList();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load videos');
    }
  }
  Future<void> addWatchHistory(String videoId) async {
    final response = await http.post(
      Uri.parse(DatabaseApi.Addwatchhistory),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${OtpApi.token}', // Replace with your auth token if needed
      },
      body: json.encode({'videoId': videoId}),
    );

    if (response.statusCode == 201) {
      log('Watch history added successfully');
    } else {
      throw Exception('Failed to add watch history');
    }
  }
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : CarouselSlider(
            options: CarouselOptions(
              height: 165.0,
              enableInfiniteScroll: false,
              viewportFraction: 0.84,
            ),
            items: videos.isNotEmpty
                ? List.generate(
                    videos.length,
                    (index) => _buildVideoCarouselItem(videos[index], true),
                  )
                : List.generate(
                    videoImages.length,
                    (index) => _buildVideoCarouselItem(videoImages[index], false),
                  ),
          );
  }
  Widget _buildVideoCarouselItem(dynamic item, bool isDataAvailable) {
    return GestureDetector(
      onTap: () {
        if (isDataAvailable) {
          addWatchHistory((item as Video).videoId);
          log('Data available');
        } else {
          log('Data not available');
        }
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: isDataAvailable
              ? Image.network(
                  'https://yourapiurl.com/videos/${(item as Video).videoId}/thumbnail', // replace this with data models present in 
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  item as String,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
