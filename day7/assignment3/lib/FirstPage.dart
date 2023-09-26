// ignore_for_file: unused_element, prefer_const_constructors, prefer_final_fields

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key, required this.ImgUrl});

  final List<String> ImgUrl;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  late String currentImage;

  @override
  void initState() {
    super.initState();
    currentImage = widget.ImgUrl[0];
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 500));
    // if failed,use refreshFailed()

    setState(() {
      final random = Random();
      int randomIndex = random.nextInt(widget.ImgUrl.length);
      currentImage = widget.ImgUrl[randomIndex];
    });

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 500));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // widget.ImgUrl.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("1번 과제"),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: Center(
          child: Container(
            width: screenWidth * .8, // adjust the size as you want.
            height: screenHeight * .4,
            child: Image.network(
              currentImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
