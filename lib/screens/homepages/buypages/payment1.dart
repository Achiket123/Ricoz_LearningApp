import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:learningapp/screens/homepages/buypages/paymentpage4.dart';
import 'package:learningapp/screens/homepages/buypages/paymentpage2.dart';

class PaymentPage1 extends StatefulWidget {
  @override
  _PaymentPage1State createState() => _PaymentPage1State();
}

class _PaymentPage1State extends State<PaymentPage1> {
  int selectedContainerIndex = -1;
  List<Color> textColors = List.filled(5, Color(0xFFF1F1F1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.55,
              height: MediaQuery.of(context).size.height * 0.19,
              child: Image.asset(
                'assets/ob86.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 42.0),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(
                        context );
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            color: Color(0xFF7D7CC9),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Payment Details',
                            style: TextStyle(
                              color: Color(0xFF7D7CC9),
                              fontSize: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Select Payment mode',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'UPI',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              buildContainer(0),
                              SizedBox(height: 2.0),
                              buildContainer(1),
                              SizedBox(height: 2.0),
                              buildContainer(2),
                            ],
                          ),
                        ),
                        SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Credit/Debit card',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedContainerIndex = 3;
                              });
                            },
                            child: buildContainer(3),
                          ),
                        ),
                        SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'More',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: buildContainer(4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildNextButton(),
        ],
      ),
    );
  }

  Widget buildContainer(int index) {
    List<String> images = [
      "ob23.png",
      "ob24.png",
      "ob25.png",
      "ob26.png",
      "ob27.png",
    ];
    List<String> texts = [
      "Gpay",
      "Paytm",
      "Other UPI",
      "Add Credit/Debit Card",
      "Net banking"
    ];

    return FutureBuilder<bool>(
      future:  Future.value(true),
      builder: (context, snapshot) {
        bool isAppAvailable = snapshot.data ?? false;

        return GestureDetector(
          onTap: isAppAvailable
              ? () {
                  setState(() {
                    if (selectedContainerIndex != -1) {
                      textColors[selectedContainerIndex] = Colors.white;
                    }
                    selectedContainerIndex = index;

                    textColors[index] = Color(0xFF7D7CC9);
                  });

                  launchPaymentApp(index);
                }
              : null,
          child: Container(
            height: MediaQuery.of(context).size.width * 0.1,
            width: MediaQuery.of(context).size.width * 0.85,
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color:
            //         index == selectedContainerIndex ?  Color(0xFF7D7CC9) : Colors.grey,
            //     width: 2.0,
            //   ),
            //   borderRadius: BorderRadius.circular(8.0),
            //   color: Colors.transparent,
            // ),
            color: Color(0xFFF1F1F1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        height: MediaQuery.of(context).size.width * 0.05,
                        margin: EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/${images[index]}"),
                            //fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      Text(
                        texts[index],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'pay rs.xxx',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: textColors[index],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildNextButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: selectedContainerIndex != -1 ? 100 : 80,
        height: 40,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selectedContainerIndex != -1 ?  Color(0xFF7D7CC9) : Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: GestureDetector(
          onTap: selectedContainerIndex != -1 ? () => _navigateToPage2() : null,
          child: Center(
            child: Text(
              'Next',
              style: TextStyle(
                color:
                    selectedContainerIndex != -1 ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToPage2() {
    if (selectedContainerIndex >= 0 && selectedContainerIndex <= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PaymentPage4()),
      );
    } else if (selectedContainerIndex >= 3 && selectedContainerIndex <= 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PaymentPage2()),
      );
    }
  }

  Future<bool> canLaunchPaymentApp(int index) async {
    switch (index) {
      case 0: // Gpay
        return await canLaunch("https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.paisa.user");
      case 1: // Paytm
        return await canLaunch("https://play.google.com/store/apps/details?id=net.one97.paytm");
      case 2: // Other UPI 
        return await canLaunch("upi://pay");
      default:
        return false;
    }
  }

  void launchPaymentApp(int index) async {
    switch (index) {
      case 0: // Gpay
        await launch("https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.paisa.user");
        break;
      case 1: // Paytm
        await launch("https://play.google.com/store/apps/details?id=net.one97.paytm");
        break;
      case 2: // Other UPI 
        await launch("upi://pay");
        break;
      default:
        break;
    }
  }
}
