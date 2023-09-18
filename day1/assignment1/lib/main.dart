import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          text: '봄여름가을겨울\n',
          // style: DefaultTextStyle.of(context).style,
          style: TextStyle(color: Colors.black),
          children: <TextSpan>[
            TextSpan(
                text:
                    '이듬해 질 녘 꽃 피는 봄 한여름 밤의 꿈\n 가을 타 겨울 내릴 눈 일 년 네 번 또다시 봄\n 정들었던 내 젊은 날 이제는 안녕\n 아름답던 우리의 봄 여름 가을 겨울\n Four seasons with no reason)\n',
                style: TextStyle(color: Colors.pink, height: 1.5)),
            TextSpan(
                text:
                    "비 갠 뒤에 비애 대신 a happy end\n 비스듬히 씩 비웃듯 칠색 무늬의 무지개\n 철없이 철 지나 철들지 못해 (still)\n 철부지에 철 그른지 오래\n Marchin' 비발디, 차이코프스키\n 오늘의 사계를 맞이해 (boy)\n 마침내, 마치 넷이 못내\n",
                style: TextStyle(color: Colors.blue, height: 1.5)),
            TextSpan(
                text:
                    '저 하늘만 바라보고서 사계절 잘 지내고 있어 \n , goodbye 떠난 사람 또 나타난 사람 머리 위 저세상 \n, 난 떠나 영감의 amazon \n 지난 밤의 트라우마 다 묻고\n  목숨 바쳐 달려올 \n 새 출발 하는 왕복선 변할래\n  전보다는 더욱더 좋은 사람 더욱더, 더 나은 사람 더욱더\n ',
                style: TextStyle(color: Colors.green, height: 1.5)),
            TextSpan(
                text:
                    '아침 이슬을 맞고 (내 안에)\n 내 안에 분노 과거에 묻고\n  For life, do it away, away, away\n',
                style: TextStyle(color: Colors.red, height: 1.5)),
          ],
        ),
      ),
    )));
  }
}
