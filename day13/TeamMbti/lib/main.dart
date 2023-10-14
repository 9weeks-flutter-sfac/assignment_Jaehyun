// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);
}

Dio dio = Dio();
Future<List<Todo>> getData() async {
  var url = "https://jsonplaceholder.typicode.com/todos";
  var res = await dio.get(url);
  if (res.statusCode == 200) {
    var data = List<Map<String, dynamic>>.from(res.data);
    return data.map((e) => Todo.fromMap(e)).toList();
  }
  return [];
}

Future<void> main() async {
  var List = await getData();
  print(List);
  print(List[1]);
  print(List[1].completed);
}
