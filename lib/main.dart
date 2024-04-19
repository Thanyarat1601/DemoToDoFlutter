import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/signin.dart';
import 'View/signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
