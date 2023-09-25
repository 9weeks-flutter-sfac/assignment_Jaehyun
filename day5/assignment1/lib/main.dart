import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('1번과제'),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FirstPage())),
            ),
            ElevatedButton(
              child: Text('2번과제'),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage())),
            ),
            ElevatedButton(
              child: Text('3번과제'),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ThirdPage())),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List animalList = ['강아지', '고양이', '앵무새', '토끼', '오리', '거위', '원숭이'];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("1번과제")),
      body: ListView.builder(
          controller: _scrollController,
          itemCount: animalList.length,
          itemBuilder: (context, index) {
            return Container(
              height: 300,
              child: Center(child: Text(animalList[index])),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(0.0,
                duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          },
          child: Icon(Icons.vertical_align_top)),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String inputText = '';
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("2번과제")),
        body: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  inputText = value;
                });
              },
              controller: controller,
            ),
            Text(inputText)
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                inputText = '';
                controller.clear();
              });
            },
            child: Icon(Icons.close)));
  }
}

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  bool sunIconActive = false;
  bool moonIconActive = false;
  bool starIconActive = false;

  final TextEditingController controller = TextEditingController();

  void resetIcons() {
    setState(() {
      sunIconActive = false;
      moonIconActive = false;
      starIconActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("3번과제")),
      body: Column(children: [
        buildRow(Icons.wb_sunny, "Sun", () {
          setState(() {
            sunIconActive = !sunIconActive;
          });
        }),
        buildRow(Icons.nights_stay, "Moon", () {
          setState(() {
            moonIconActive = !moonIconActive;
          });
        }),
        buildRow(Icons.star, "Star", () {
          setState(() {
            starIconActive = !starIconActive;
          });
        }),
        TextField(
            controller: controller,
            onSubmitted: (value) {
              switch (value) {
                case "태양":
                  setState(() {
                    sunIconActive = !sunIconActive;
                  });
                  break;
                case "달":
                  setState(() {
                    moonIconActive = !moonIconActive;
                  });
                  break;
                case "별":
                  setState(() {
                    starIconActive = !starIconActive;
                  });
                default:
                  break;
              }
            }),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: resetIcons,
        child: Icon(Icons.close),
      ),
    );
  }

  Widget buildRow(IconData iconName, title, callback) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      IconButton(
        icon: Icon(iconName),
        color: iconName == Icons.wb_sunny
            ? (sunIconActive ? Colors.orange : Colors.grey)
            : iconName == Icons.nights_stay
                ? (moonIconActive ? Colors.blue : Colors.grey)
                : iconName == Icons.star
                    ? (starIconActive ? Colors.yellow : Colors.grey)
                    : null,
        onPressed: callback,
      ),
      Text(title),
      IconButton(
        icon: Icon(Icons.navigate_next),
        color: Colors.black,
        onPressed: callback,
      ),
    ]);
  }
}
