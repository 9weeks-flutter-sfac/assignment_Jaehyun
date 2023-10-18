import 'package:assignment2/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserTail extends GetView<AuthController> {
  const UserTail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(),
          title: Text("${controller.user!.username} 님 안녕하세요"),
          subtitle: Text(controller.user!.name),
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("로그아웃"),
          onTap: () => controller.logout(),
        )
      ],
    );
  }
}
