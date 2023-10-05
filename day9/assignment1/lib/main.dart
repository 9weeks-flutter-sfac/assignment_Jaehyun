import 'package:assignment2/Pages/HomePage.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "neo"),
      home: HomePage(),
    );
  }
}
