import 'package:flutter/material.dart';
import 'package:learningapp/screens/homepages/buypages/paymentpage3.dart';
class PaymentPage2 extends StatefulWidget {
  @override
  _PaymentPage2State createState() => _PaymentPage2State();
}

class _PaymentPage2State extends State<PaymentPage2> {
  List<TextEditingController> controllers = List.generate(5, (_) => TextEditingController());
  int selectedContainerIndex = -1;

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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
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
                              color:  Color(0xFF7D7CC9),
                              fontSize: 22.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height:  MediaQuery.of(context).size.height * 0.05),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Card Number',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        buildTextField(0, 'Card Number'),
                        
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Expiry Date',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        buildTextField(2, 'Expiry Date'),
                       
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'CVV',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildTextField(4, 'CVV'),
                  ),
                ],
              ),
            ),
          ),
          buildContinuePaymentButton(),
        ],
      ),
    );
  }

  Widget buildContainer(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedContainerIndex = index;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.width * 0.05,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          border: Border.all(
            color: index == selectedContainerIndex
                ?  Color(0xFF7D7CC9)
                : Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.transparent,
        ),
      ),
    );
  }

  Widget buildTextField(int index, String hint) {
    return TextField(
      controller: controllers[index],
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color:  Color(0xFF7D7CC9),
            width: 2.0,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          selectedContainerIndex = index;
        });
      },
    );
  }

  Widget buildContinuePaymentButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: selectedContainerIndex != -1 ? 160 : 80,
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
              'Continue Payment',
              style: TextStyle(
                color: selectedContainerIndex != -1 ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToPage2() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentPage3()),
    );
  }
}
