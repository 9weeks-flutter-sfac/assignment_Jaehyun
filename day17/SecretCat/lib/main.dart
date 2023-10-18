import 'package:assignment2/view/pages/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding:
      // initialRoute: ,
      getPages: [],
      home: LoginPage(),
    );
  }
}
