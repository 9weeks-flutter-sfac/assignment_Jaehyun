import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  const CardItem({super.key, required this.msg, required this.url});
  final String msg;
  final String url;

  @override
  State<CardItem> createState() => _CardState();
}

class _CardState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width / 2 - 8,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(1, 1), // Position of shadow
              blurRadius: 5, // Softness of shadow
              spreadRadius: 1, // Extend/Reduce shadow
            )
          ]),
      child: Column(
        children: [
          Container(
            width:
                MediaQuery.of(context).size.width / 2 - 16, // Padding을 고려하여 계산
            height: 230 - 16, // Padding을 고려하여 계산
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(widget.url), fit: BoxFit.cover),
            ),
          ),
          Expanded(
              child: Center(
                  child: Text(
            widget.msg,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ))),
        ],
      ),
    );
  }
}
