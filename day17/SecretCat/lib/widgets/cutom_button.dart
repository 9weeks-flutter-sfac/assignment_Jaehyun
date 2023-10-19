import 'package:assignment2/view/pages/upload_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.fontSize = 24,
      this.tapColor = Colors.white10,
      this.sizeBoxHeight = 16});
  final onPressed;
  final title;
  final double fontSize;
  final double sizeBoxHeight;
  final tapColor;

  @override
  Widget build(BuildContext context) {
    var textcolor = Colors.white70;

    return Column(
      children: [
        TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.resolveWith((states) => tapColor)),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 6.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: textcolor),
                  ),
                  Icon(
                    Icons.navigate_next_sharp,
                    color: textcolor,
                  )
                ],
              ),
            )),
        SizedBox(
          height: sizeBoxHeight,
        )
      ],
    );
  }
}
