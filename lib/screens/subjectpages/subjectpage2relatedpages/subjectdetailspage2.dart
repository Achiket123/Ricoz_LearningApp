import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learningapp/screens/subjectpages/readmanualandrealtedpages/readingmaterialvideos.dart';
import 'package:learningapp/features/videocarousel.dart';
class DetailPage2 extends StatefulWidget {
  @override
  _DetailPage2State createState() => _DetailPage2State();
}

class _DetailPage2State extends State<DetailPage2> {
  bool showFullLoremIpsum = false;
  TextEditingController _searchController = TextEditingController();
  late CameraController _cameraController;
  bool _isSearchBarEmpty = true;
   bool isBookmarked = false;

  final List<String> videoImages = [
    'assets/ob13.png',
    'assets/ob14.png',
    'assets/ob13.png',
    'assets/ob14.png',
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _isSearchBarEmpty = _searchController.text.isEmpty;
      });
    });
    _initializeCamera();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      
      return;
    }
  }

  void _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    await _cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImage(),
            _buildTextContent(),
            Divider(
              thickness: 1.0,
              color: Colors.black,
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildLoremIpsumText(),
                  SizedBox(height: 10.0),
                  if (!showFullLoremIpsum) _buildReadMoreButton(),
                  if (showFullLoremIpsum) _buildReadLessButton(),
                  _buildSectionTitle("All Videos"),
                  SizedBox(height: 20),
                  buildVideoCarousel(),
                  SizedBox(height: 30),
                  _buildSectionTitle("Question Desk"),
                  SizedBox(height: 20),
                  _buildContainerWithText(
                      "Q.1. Which of the following is a characteristic property of an acid\n A.?"),
                  SizedBox(height: 10),
                  _buildContainerWithText(
                      "Q.2. Which of the following is a characteristic property of an acid?\n A."),
                  SizedBox(height: 10),
                  _buildContainerWithText(
                      "Q.3. Which of the following is a characteristic property of an acid?\n A."),
                  SizedBox(height: 30),
                  _buildSearchBar2(),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: _buildSendButton(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Image.asset('assets/ob78.png', fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildSendButton() {
    return GestureDetector(
      onTap: () {
    
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Readingmaterialvideo(),
          ),
        );
      },
      child: Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: _isSearchBarEmpty ? Colors.grey : Color(0xFF7D7CC9),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            'Send',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Chemical Reactions & Equations',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isBookmarked = !isBookmarked;
                  });
                },
                child: Icon(
                  isBookmarked
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: Color(0xFF7D7CC9),
                ),
              ),
            ],
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices id metus vel placerat.',
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoremIpsumText() {
    return Text(
      showFullLoremIpsum
          ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices id metus vel placerat. Integer ullamcorper gravida risus, vel cursus turpis bibendum vel.'
          : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
      style: TextStyle(
        fontSize: 15.0,
      ),
    );
  }

  Widget _buildReadMoreButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          setState(() {
            showFullLoremIpsum = true;
          });
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
        ),
        child: _buildButtonContainer('Read More'),
      ),
    );
  }

  Widget _buildReadLessButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          setState(() {
            showFullLoremIpsum = false;
          });
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
        ),
        child: _buildButtonContainer('Read Less'),
      ),
    );
  }

  Widget _buildButtonContainer(String text) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF7D7CC9),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Widget _buildVideoCarousel() {
  //   return CarouselSlider(
  //     options: CarouselOptions(
  //       height: 195.0,
  //       enableInfiniteScroll: false,
  //       viewportFraction: 0.84,
  //     ),
  //     items: List.generate(
  //       videoImages.length,
  //       (index) => _buildVideoCarouselItem(videoImages[index]),
  //     ),
  //   );
  // }

  // Widget _buildVideoCarouselItem(String videoImagePath) {
  //   return Container(
  //     width: double.infinity,
  //     margin: EdgeInsets.symmetric(horizontal: 4.0),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(8.0),
  //       border: Border.all(color: Colors.grey),
  //     ),
  //     child: Image.asset(
  //       videoImagePath,
  //       fit: BoxFit.cover,
  //     ),
  //   );
  // }

  Widget _buildSearchBar2() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Icon(Icons.search,color: Color(0xFF7D7CC9),),
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Ask.',
                ),
              ),
            ),
            IconButton(
              icon:  Icon(Icons.camera_alt_outlined,color: Color(0xFF7D7CC9)),
              onPressed: () {
                _openCamera();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainerWithText(String text) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
