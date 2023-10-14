import 'dart:ui';

import 'package:assignment2/model/todo.dart';
import 'package:assignment2/widgets/FilterBottomSheet.dart';
import 'package:assignment2/widgets/TodoCard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Dio dio = Dio();
  List<Todo> todos = [];
  TodoFilter todoFilter = TodoFilter.all;

  readTodos() async {
    var url = "https://jsonplaceholder.typicode.com/todos";
    var res = await dio.get(url);
    if (res.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(res.data);
      setState(() {
        todos = data.map((e) => Todo.fromMap(e)).toList();
      });
    }

    return [];
  }

  List<Todo> filter(value) {
    switch (todoFilter) {
      case TodoFilter.all:
        return value;
      case TodoFilter.completed:
        return value.where((e) => e.completed == true).toList();
      case TodoFilter.incompleted:
        return value.where((e) => e.completed == false).toList();
    }
  }

  @override
  void initState() {
    super.initState();
    readTodos();
  }

  @override
  Widget build(BuildContext context) {
    readTodos();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(),
          ),
        ),
        title: Text('Todo'),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => FilterBottomSheet(
                        filter: todoFilter,
                        onApply: (value) {
                          setState(() {
                            todoFilter = value;
                          });
                        }));
              },
              icon: Icon(Icons.filter_alt)),
          IconButton(
              onPressed: () {
                readTodos();
              },
              icon: Icon(Icons.refresh_sharp))
        ],
      ),
      body: ListView.builder(
        itemCount: filter(todos).length,
        itemBuilder: (context, index) {
          return TodoCard(todo: filter(todos)[index]);
        },
      ),
    );
  }
}
