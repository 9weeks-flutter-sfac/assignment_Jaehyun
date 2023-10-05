// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:assignment2/Pages/AuthorPage.dart';
import 'package:assignment2/Pages/SecretPage.dart';
import 'package:assignment2/Pages/UploadPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(),
                child: Text(
                  "갈대숲",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              DefaultTextStyle(
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                child: Container(
                  child: Column(children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecretPage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '갈대숲 확인하기',
                            ),
                            Icon(Icons.navigate_next_sharp)
                          ],
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuthorPage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '갈대숲에 누가있을까?',
                            ),
                            Icon(Icons.navigate_next_sharp)
                          ],
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UploadPage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '갈대숲에 외치러가기',
                            ),
                            Icon(Icons.navigate_next_sharp)
                          ],
                        )),
                  ]),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
