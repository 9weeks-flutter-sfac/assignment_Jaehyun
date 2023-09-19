import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    '오늘의 하루는',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '어땠나요?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: 300,
                height: 200,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          '우울함',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.black, Colors.white])),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          '행복함',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromARGB(255, 239, 136, 2),
                                Color.fromARGB(255, 255, 255, 255)
                              ])),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          '상쾌함',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromARGB(255, 80, 18, 236),
                                Color.fromARGB(255, 20, 232, 23)
                              ])),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                color: const Color.fromARGB(255, 73, 146, 206),
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://plus.unsplash.com/premium_photo-1663091649666-70c9e132fb21?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80")),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Column(
                              children: [
                                Text(
                                  "라이언",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                Text(
                                  "게임개발",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Text(
                                  "C#, Unity",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
