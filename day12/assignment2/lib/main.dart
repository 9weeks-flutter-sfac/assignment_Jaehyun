import 'dart:math';

import 'package:dio/dio.dart';
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
  var dio = Dio();
  Future getData() async {
    var res = await dio.get("https://sniperfactory.com/sfac/http_json_data");
    if (res.statusCode == 200) {
      print(res.data);
      return res.data['item'];
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(child: Image.network(snapshot.data['image'].toString())),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(color: Colors.white12),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          snapshot.data["name"].toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(),
                      Wrap(children: [
                        Text(snapshot.data["description"].toString())
                      ]),
                      SizedBox(height: 8),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(
                              '${snapshot.data["price"].toString()}원 결제하고 등록')),
                    ]),
                  ),
                ]),
          );
        },
      ),
    ));
  }
}
