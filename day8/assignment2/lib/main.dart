// ignore_for_file: non_constant_identifier_names, avoid_print, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'Card.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'models/ImageData.dart';
import 'package:shimmer/shimmer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  Future<ConnectivityResult>? _connectivityFuture;
  Future<List<ImageData>>? _imagesFuture;

  @override
  void initState() {
    super.initState();
    _imagesFuture = fetchImages();
    _connectivityFuture = Connectivity().checkConnectivity();
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 3000));
    if (mounted) {
      setState(() {
        _imagesFuture = fetchImages();
      });
      await _imagesFuture;
    }
    _refreshController.refreshCompleted();
  }

// ...

  Future<List<ImageData>> fetchImages() async {
    print('이미지 받기위해 준비중..');
    String URL = 'https://sniperfactory.com/sfac/http_day16_dogs';
    var dio = Dio();
    var res = await dio.get(URL);
    print(res.data["body"]);

    if (res.statusCode == 200) {
      List<dynamic> jsonResponse = res.data['body'];
      print('서버 접속 성공');

      List<ImageData> imageDatas = jsonResponse
          .map((item) => ImageData.fromJson(item as Map<String, dynamic>))
          .toList();

      return imageDatas;
    } else {
      throw Exception('Failed to load images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _imagesFuture = fetchImages();
            _connectivityFuture = Connectivity().checkConnectivity();
          });
        },
        child: Icon(Icons.wifi_calling),
      ),
      appBar: AppBar(
        title: Text("8일차 과제2"),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: WaterDropHeader(),
        onRefresh: _onRefresh,
        child: FutureBuilder<List<ImageData>>(
          future: _imagesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("인터넷 연결중 입니다."),
                        Center(child: CircularProgressIndicator()),
                      ],
                    ),
                  ));
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text('Error: ${snapshot.error}');
            } else {
              return GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
                crossAxisCount: 2,
                children: snapshot.data!.map((imageData) {
                  // Use map instead of generate.
                  return CardItem(
                    msg: imageData.msg,
                    url: imageData.url,
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
