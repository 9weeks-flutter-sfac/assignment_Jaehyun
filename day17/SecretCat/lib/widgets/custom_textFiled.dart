// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.controller,
      this.width = 300,
      this.sizeBoxheight = 16,
      required this.hintText,
      this.isPassword = false,
      this.minLines,
      this.maxLines,
      this.focusNode});
  final controller;
  final focusNode;
  final hintText;
  final double width;
  final double sizeBoxheight;
  final isPassword;
  final minLines;
  final maxLines;

  @override
  Widget build(BuildContext context) {
    TextStyle textFiledTextStyle =
        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    InputDecoration textFiledInputStyle = InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black45),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70, width: 3)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white24)),
        filled: true,
        fillColor: Colors.white24);

    return Column(
      children: [
        SizedBox(
          width: width,
          child: TextField(
            focusNode: focusNode,
            cursorColor: Colors.white70,
            obscureText: isPassword,
            controller: controller,
            minLines: minLines ?? 1,
            maxLines: maxLines ?? 1,
            style: textFiledTextStyle,
            decoration: textFiledInputStyle,
          ),
        ),
        SizedBox(
          height: sizeBoxheight,
        )
      ],
    );
  }
}
