// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

import 'models/Item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Item> Items = [
    Item('맥주', 'assets/imgs/option_beer.png'),
    Item('떡볶이', 'assets/imgs/option_bokki.png'),
    Item('김밥', 'assets/imgs/option_kimbap.png'),
    Item('오므라이스', 'assets/imgs/option_omurice.png'),
    Item('돈까스', 'assets/imgs/option_pork_cutlets.png'),
    Item('라면', 'assets/imgs/option_ramen.png'),
    Item('우동', 'assets/imgs/option_udon.png'),
  ];

  List<String> result = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            '분식왕 이테디 주문하기',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: DefaultTextStyle(
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32),
          child: SafeArea(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('주문 리스트'),
                Text(
                  result.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                Container(padding: EdgeInsets.only(top: 16), child: Text('음식')),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: Items.length,
                    itemBuilder: (context, index) {
                      return AspectRatio(
                        aspectRatio: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              result.add(Items[index].name);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(1),
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                                offset: const Offset(1, 1),
                              )
                            ]),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    width: 200,
                                    height: 100,
                                    child: Image.asset(
                                      Items[index].imgUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Text(
                                  Items[index].name,
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text('담기', style: TextStyle(fontSize: 16))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )),
        ),
        floatingActionButton: SizedBox(
          width: 130,
          height: 55,
          child: FloatingActionButton.extended(
            label: Text(
              '초기화 하기',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onPressed: () {
              setState(() {
                result.clear();
              });
            },
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat, // Here
      ),
    );
  }
}
