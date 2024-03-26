import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
final List<String> videoImages = [
    'assets/ob13.png',
    'assets/ob108.png',
    'assets/ob13.png',
    'assets/ob108.png',
  ];
Widget buildVideoCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 165.0,
        enableInfiniteScroll: false,
        viewportFraction: 0.84,
      ),
      items: List.generate(
        videoImages.length,
        (index) => _buildVideoCarouselItem(videoImages[index]),
      ),
    );
  }

  Widget _buildVideoCarouselItem(String videoImagePath) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          videoImagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }