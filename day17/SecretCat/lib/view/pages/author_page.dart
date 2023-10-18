// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';

var bgImgUrl =
    "https://plus.unsplash.com/premium_photo-1664112065957-14bed05d96fd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2187&q=80";

class AuthorPage extends StatefulWidget {
  const AuthorPage({super.key});
  static const String route = '/author';

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(bgImgUrl),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)),
        ),
        // child: FutureBuilder(
        //   future: SecretCatApi.fetchAuthors(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return GridView.builder(
        //         itemCount: snapshot.data?.length,
        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 3,
        //         ),
        //         itemBuilder: (context, index) {
        //           return ZoomIn(
        //             delay: Duration(milliseconds: 200 * index),
        //             child: Column(
        //               children: [
        //                 CircleAvatar(
        //                     backgroundColor: Colors.transparent,
        //                     radius: 48,
        //                     backgroundImage: NetworkImage(
        //                       snapshot.data![index].avatar!,
        //                     )),
        //                 Text(
        //                   snapshot.data![index].username,
        //                   style: TextStyle(color: Colors.white),
        //                 )
        //               ],
        //             ),
        //           );
        //         },
        //       );
        //     }
        //     return CircularProgressIndicator();
        //   },
        // ),
      ),
    );
  }
}
