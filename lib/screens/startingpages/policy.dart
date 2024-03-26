import 'package:flutter/material.dart';

class PolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.55,
                height: MediaQuery.of(context).size.height * 0.19,
                child: Image.asset(
                  'assets/ob101.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:1.0,vertical: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Colors.pink,
                              ),
                              SizedBox(width: 16),
                              Text(
                                'Privacy Policy ',
                                style: TextStyle(color: Colors.pink, fontSize: 20.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      boldText('1. Information Collection:'),
                      SizedBox(height: 8),
                      normalText(
                        'We collect necessary information during registration and usage to provide our services effectively. This may include personal details, academic information, and usage data.',
                      ),
                      SizedBox(height: 16),
                      boldText('2. Usage of Information:'),
                      SizedBox(height: 8),
                      normalText(
                        'Your data is used to personalize your learning experience, offer relevant content, and improve our services. We do not share your personal information with third parties without your consent.',
                      ),
                      SizedBox(height: 16),
                      boldText('3. Data Security:'),
                      SizedBox(height: 8),
                      normalText(
                        'We implement industry-standard security measures to protect your data from unauthorized access or misuse.',
                      ),
                      SizedBox(height: 16),
                      boldText('4. Cookies and Tracking:'),
                      SizedBox(height: 8),
                      normalText(
                        'We may use cookies and tracking technologies to enhance your experience and gather non-personal data for analysis.',
                      ),
                      SizedBox(height: 16),
                      boldText('5. Communication:'),
                      SizedBox(height: 8),
                      normalText(
                        'We may contact you for updates, offers, and relevant information. You can opt out of such communication at any time.',
                      ),
                      SizedBox(height: 16),
                      boldText('6. Third-Party Links:'),
                      SizedBox(height: 8),
                      normalText(
                        'Our app may contain links to third-party websites. We are not responsible for their privacy practices.',
                      ),
                      SizedBox(height: 16),
                      boldText('7. Children\'s Privacy:'),
                      SizedBox(height: 8),
                      normalText(
                        'Our services are intended for users above the age of 13. We do not knowingly collect information from children without parental consent.',
                      ),
                      SizedBox(height: 16),
                      boldText('8. Changes to Privacy Policy:'),
                      SizedBox(height: 8),
                      normalText(
                        'We may update this policy periodically. Continued use of our app signifies your acceptance of these changes.',
                      ),

                      // Terms & Conditions section
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left:16.0),
                        child: Text(
                          'Terms & Conditions',
                          style: TextStyle(color: Colors.pink, fontSize: 20.0),
                        ),
                      ),
                      SizedBox(height: 16),
                      boldText('1.User Conduct:'),
                      SizedBox(height: 8),
                      normalText(
                        'Users must use the app for lawful and educational purposes. Any misuse, harassment, or harmful behavior is strictly prohibited.',
                      ),
                      SizedBox(height: 16),
                      boldText('2.Intellectual Property:'),
                      SizedBox(height: 8),
                      normalText(
                        'All content, including text, images, and logos, is protected by intellectual property laws. Users may not reproduce, distribute, or modify any content without permission.',
                      ),
                      SizedBox(height: 16),
                      boldText('3.User Accounts:'),
                      SizedBox(height: 8),
                      normalText(
                        'Users are responsible for maintaining the confidentiality of their account credentials. Any activity performed using their account is their responsibility.',
                      ),
                      SizedBox(height: 16),
                      boldText('4.Tutoring Services:'),
                      SizedBox(height: 8),
                      normalText(
                        'Name connects students with tutors for educational purposes. We do not guarantee the accuracy or effectiveness of the tutoring sessions.',
                      ),
                      SizedBox(height: 16),
                      boldText('5.Payment:'),
                      SizedBox(height: 8),
                      normalText(
                        'Users agree to the payment terms specified during the purchase of any services. We use secure payment gateways to process transactions.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget boldText(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget normalText(String text) {
    return Text(
      text,
    );
  }
}
