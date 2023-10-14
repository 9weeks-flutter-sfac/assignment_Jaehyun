import 'package:animate_do/animate_do.dart';
import 'package:assignment2/Model/profile.dart';
import 'package:assignment2/Pages/Detail_Page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Dio dio = Dio();
  List<Profile> profiles = [];

  readUsers() async {
    var url = "https://jsonplaceholder.typicode.com/users";
    var res = await dio.get(url);
    if (res.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(res.data);
      profiles = data.map((e) => Profile.fromMap(e)).toList();
      print(profiles);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('연락처'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (context, index) => FadeInRight(
              delay: Duration(milliseconds: 100 * index),
              child: ListTile(
                title: Text(profiles[index].name),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://xsgames.co/randomusers/assets/avatars/male/${profiles[index].id}.jpg"),
                ),
                subtitle: Text(profiles[index].email),
                trailing: IconButton(
                  icon: Icon(Icons.navigate_next),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(profile: profiles[index])));
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
