import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learningapp/screens/startingpages/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences? prefs;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PlusJakartaSans',
      ),
      home: Onboarding(),
    );
  }
}

void customPrint(message, val) {
  log("$message :: $val");
}
