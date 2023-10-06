// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:assignment2/Pages/AuthorPage.dart';
import 'package:assignment2/Pages/SecretPage.dart';
import 'package:assignment2/Pages/UploadPage.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    // 비디오 플레이어 컨트롤러를 초기화합니다.
    _controller = VideoPlayerController.asset('assets/videos/bg-video.mp4')
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
        // 비디오가 준비되면 반복 재생합니다.
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    // 비디오 플레이어 컨트롤러를 해제합니다.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        if (_isVideoInitialized)
          Positioned.fill(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ),
        Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Text(
                    "갈대숲",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                DefaultTextStyle(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  child: Container(
                    child: Column(children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecretPage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '갈대숲 확인하기',
                              ),
                              Icon(Icons.navigate_next_sharp)
                            ],
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AuthorPage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '갈대숲에 누가있을까?',
                              ),
                              Icon(Icons.navigate_next_sharp)
                            ],
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UploadPage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '갈대숲에 외치러가기',
                              ),
                              Icon(Icons.navigate_next_sharp)
                            ],
                          )),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
