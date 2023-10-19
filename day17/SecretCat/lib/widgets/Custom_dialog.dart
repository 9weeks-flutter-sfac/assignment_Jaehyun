import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog(
      {Key? key, required this.title, required this.content, this.onPressed})
      : super(key: key);

  final String title;
  final String content;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(32),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        textAlign: TextAlign.center,
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.white70,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      actions: <Widget>[
        TextButton(
          child: Center(
              child: Text(
            '확인',
            style: TextStyle(color: Colors.black),
          )),
          onPressed: onPressed ?? () => Get.back(),
        ),
      ],
    );
  }
}
