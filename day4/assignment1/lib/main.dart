// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  final TextEditingController xController = TextEditingController();
  final TextEditingController yController = TextEditingController();

  int numX = 0;
  int numY = 0;

  showResultDialog(BuildContext context, var result) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 150,
            child: Center(
                child: Text(
              "$result",
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.only(bottom: 16),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("X의 값은?"),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      width: 250,
                      child: TextField(
                        controller: xController,
                        onChanged: (value) {
                          numX = int.parse(value);
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.blue),
                          hintText: "X 값을 입력하세요.",

                          // filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Y의 값은?"),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      width: 250,
                      child: TextField(
                        controller: yController,
                        onChanged: (value) {
                          numY = int.parse(value);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.blue),
                          hintText: "Y 값을 입력하세요.",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    showResultDialog(context, numX + numY);
                    xController.clear();
                    yController.clear();
                  },
                  child: Text('+')),
              ElevatedButton(
                  onPressed: () {
                    showResultDialog(context, numX * numY);
                    xController.clear();
                    yController.clear();
                  },
                  child: Text('*')),
              ElevatedButton(
                  onPressed: () {
                    showResultDialog(context, numX - numY);
                    xController.clear();
                    yController.clear();
                  },
                  child: Text('-')),
              ElevatedButton(
                  onPressed: () {
                    showResultDialog(context, numX / numY);
                    xController.clear();
                    yController.clear();
                  },
                  child: Text('/')),
            ],
          ),
        ),
      ),
    );
  }
}
