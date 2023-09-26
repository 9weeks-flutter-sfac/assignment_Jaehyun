import 'package:flutter/material.dart';

class WordWidget extends StatelessWidget {
  const WordWidget({super.key, required this.words, required this.index});
  final List words;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 18, letterSpacing: -1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                words[index]["word"].toString(),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              words[index]["meaning"].toString(),
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white54),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              child: Text(
                words[index]["example"].toString(),
                style: TextStyle(
                    fontSize: 15, letterSpacing: 1, color: Colors.white54),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
