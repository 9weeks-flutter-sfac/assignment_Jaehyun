// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable
// ignore: prefer_const_literals_to_create_immutables
import 'package:assignment1/ItemTile.dart';
import 'package:assignment1/models/tea.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<Tea> teas = [
    Tea("골든 미모사 그린 티", "Golden Mimosa Green Tea", "6100원",
        'assets/imgs/item_drink1.jpeg'),
    Tea("블랙 햅쌀 고봉 라떼", "Black Rice Latte", "6300원",
        'assets/imgs/item_drink2.jpeg'),
    Tea("아이스 블랙 햅쌀 고봉 라떼", "Iced Black Rice Latte", "6100원",
        'assets/imgs/item_drink3.jpeg'),
    Tea("스타벅스 튜메릭 라떼", "Starbucks Turmeric Latte", "6100원",
        'assets/imgs/item_drink4.jpeg'),
    Tea("아이스 스타벅스 튜메릭 라떼", "Iced Starbucks Turmeric Latte", "6200원",
        'assets/imgs/item_drink5.jpeg'),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Icon(Icons.arrow_back_ios),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.search),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 16),
                  child: Text(
                    'NEW',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: teas.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(teas[index].imgUrl),
                                radius: 48,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(teas[index].name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                                Text(
                                  teas[index].EngName,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(teas[index].price,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.card_giftcard), label: 'Pay'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_cafe), label: 'Order'),
              BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'shop'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.other_houses), label: 'other'),
            ],
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.green,
            currentIndex: 2,
            // unselectedItemColor: Colors.grey,
            // selectedItemColor: Colors.green,
          ),
          bottomSheet: Container(
            height: 60,
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "주문할 매장을 선택해 주세요.",
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  Icon(
                    Icons.expand_more,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
