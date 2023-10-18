import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecretPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '갈대숲 확인하기',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.navigate_next_sharp,
                    color: Colors.white,
                  )
                ],
              )),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AuthorPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '갈대숲에 누가있을까?',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.navigate_next_sharp,
                    color: Colors.white,
                  )
                ],
              )),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UploadPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '갈대숲에 외치러가기',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.navigate_next_sharp,
                    color: Colors.white,
                  )
                ],
              )),
        ]),
      ),
    );
  }
}
