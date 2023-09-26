// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:assignment2/QuizCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // data
  List<Map<String, dynamic>> quizs = [
    {
      "question": "의학적으로 얼굴과 머리를 구분하는 기준은 어디일까요?",
      "answer": 2,
      "options": ["코", "눈썹", "귀", "머리카락"]
    },
    {
      "question": "다음 중 바다가 아닌 곳은?",
      "answer": 3,
      "options": ["카리브해", "오호츠크해", "사해", "지중해"]
    },
    {
      "question": "심청이의 아버지 심봉사의 이름은?",
      "answer": 2,
      "options": ["심전도", "심학규", "심한길", "심은하"]
    },
    {
      "question": "심청전에서 심청이가 빠진 곳은 어디일까요?",
      "answer": 4,
      "options": ["정단수", "육각수", "해모수", "인당수"]
    },
    {
      "question": "택시 번호판의 바탕색은?",
      "answer": 3,
      "options": ["녹색", "흰색", "노란색", "파란색"]
    }
  ];

  void onPreviousPage() => {
        pageController.previousPage(
            duration: Duration(seconds: 1), curve: Curves.easeIn)
      };

  void onNextPage() => {
        pageController.nextPage(
            duration: Duration(seconds: 1), curve: Curves.easeIn)
      };
  List<Icon> result = [];
  var pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(value),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pinkAccent, Colors.blue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: result,
            ),
            leading: IconButton(
              onPressed: onPreviousPage,
              icon: Icon(Icons.navigate_before),
            ),
            actions: [
              IconButton(
                onPressed: onNextPage,
                icon: Icon(Icons.navigate_next),
              ),
            ],
          ),
          body: PageView.builder(
            controller: pageController,
            itemCount: quizs.length,
            itemBuilder: (context, index) {
              return QuizCard(
                quiz: quizs[index],
                onCorrect: () {
                  print('정답');
                  result.add(Icon(Icons.circle_rounded));
                  onNextPage();
                  setState(() {});
                },
                onIncorrect: () {
                  result.add(Icon(Icons.close));
                  print('정답아님');
                  onNextPage();
                  setState(() {});
                },
              );
            },
          ),
          floatingActionButton: result.length == quizs.length
              ? FloatingActionButton(
                  onPressed: () {
                    result.clear();
                    pageController.jumpToPage(0);
                    setState(() {});
                  },
                  backgroundColor: Colors.white,
                  child: Icon(Icons.refresh),
                )
              : null),
    );
  }
}
