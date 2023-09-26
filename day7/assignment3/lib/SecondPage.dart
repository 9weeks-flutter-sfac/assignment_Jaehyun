import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key, required this.ImgUrl});

  final List<String> ImgUrl;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2번 과제'),
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
              height: MediaQuery.of(context).size.height * .25,
              autoPlay: true,
              viewportFraction: 0.8,
              autoPlayInterval: Duration(milliseconds: 2500)),
          items: widget.ImgUrl.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                        // make sure we apply clip it properly
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(i, fit: BoxFit.cover)));
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
