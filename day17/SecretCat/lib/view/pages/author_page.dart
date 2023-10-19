// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:assignment2/controller/secret_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var bgImgUrl =
    "https://images.unsplash.com/photo-1663465374413-83cba00bff6f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2080&q=80";

class AuthorPage extends GetView<SecretController> {
  const AuthorPage({super.key});
  static const String route = '/author';

  @override
  Widget build(BuildContext context) {
    final textStlye = TextStyle(
        fontSize: 24, color: Colors.white70, fontWeight: FontWeight.bold);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "작성한 유저",
          style: textStlye,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: NetworkImage(bgImgUrl),
                fit: BoxFit.scaleDown,
                colorFilter:
                    ColorFilter.mode(Colors.black54, BlendMode.darken)),
          ),
          child: Obx(() {
            if (controller.secrets.isEmpty) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: controller.author.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1615497001839-b0a0eac3274c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2187&q=80"),
                    ),
                    title: Text(
                      controller.author[index],
                      style: TextStyle(color: Colors.white70),
                    ),
                  );
                },
              );
            }
          })),
    );
  }
}
