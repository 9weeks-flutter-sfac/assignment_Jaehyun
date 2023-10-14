import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/dict.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var keyword = "run";
  var url = "https://api.dictionaryapi.dev/api/v2/entries/en/";
  Dio dio = Dio();
  List<Dict> dataList = [];

  readData() async {
    var res = await dio.get(url + keyword);
    if (res.statusCode == 200) {
      var dict = Dict.fromMap(res.data.first);
      print(dict);
    }
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("d"),
      ),
    );
  }
}
