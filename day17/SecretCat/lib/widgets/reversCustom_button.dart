import 'package:assignment2/view/pages/upload_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ReverseCustomButton extends StatelessWidget {
  const ReverseCustomButton(
      {super.key, this.onPressed, this.title, this.fontSize = 24});
  final onPressed;
  final title;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    var textcolor = Colors.white70;

    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith(
                (states) => const Color.fromARGB(74, 244, 67, 54))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.navigate_before_sharp,
              color: textcolor,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: textcolor),
            ),
          ],
        ));
  }
}
