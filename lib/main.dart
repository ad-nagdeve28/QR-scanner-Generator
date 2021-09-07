import 'package:flutter/material.dart';
import 'package:qr_scanner/Screen/QRGenerator.dart';
import 'Screen/HomeScreen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

