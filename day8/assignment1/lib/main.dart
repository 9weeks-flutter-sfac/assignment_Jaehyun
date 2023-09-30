import 'package:flutter/material.dart';
import 'dart:math';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('1번과제 ')),
        body: Center(
          child: TextButton(
            onPressed: sendPostRequest,
            child: Text('POST 통신'),
          ),
        ),
      ),
    );
  }
}

// 정답 5292304 - result = 119
Future<void> sendPostRequest() async {
  final dio = Dio();
  int result = 101;
  for (result; result < 151; result++) {
    String url = "https://sniperfactory.com/sfac/http_assignment_$result";
    try {
      var response = await dio.post(
        url,
        options: Options(headers: {
          'User-Agent': 'SniperFactoryBrowser',
          'authorization': 'bearer ez-1234'
        }),
      );

      if (response.statusCode == 200) {
        print('성공! ${result}');
        print('Response body: ${response.data}');
      } else {
        print('실패');
        print(result);
      }
    } catch (e) {
      print('${result}');
      print(e.toString());
    }
  }
}
