// ignore_for_file: prefer_const_constructors

import 'package:assignment2/WordWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _controller = PageController();

  List<Map<String, String>> words = [
    {"word": "apple", "meaning": "사과", "example": "I want to eat an apple"},
    {"word": "paper", "meaning": "종이", "example": "Could you give me a paper"},
    {
      "word": "resilient",
      "meaning": "탄력있는, 회복력있는",
      "example": "She's a resilient girl"
    },
    {
      "word": "revoke",
      "meaning": "취소하다",
      "example":
          "The authorities have revoked their original decision to allow development of this rural area."
    },
    {
      "word": "withdraw",
      "meaning": "철회하다",
      "example":
          "After lunch, we withdrew into her office to finish our discussion in private."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: FloatingActionButton(
              onPressed: () => _controller.previousPage(
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn),
              child: Icon(Icons.navigate_before),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: FloatingActionButton(
              onPressed: () => _controller.nextPage(
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn),
              child: Icon(Icons.navigate_next),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
            child: PageView.builder(
          controller: _controller,
          itemCount: words.length,
          itemBuilder: (context, index) {
            return WordWidget(words: words, index: index);
          },
        )),
      ),
    );
  }
}
