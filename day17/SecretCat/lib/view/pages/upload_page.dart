// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';

var bgImgUrl =
    "https://plus.unsplash.com/premium_photo-1664112065957-14bed05d96fd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2187&q=80";

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});
  static const String route = '/upload';

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(bgImgUrl),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black54, BlendMode.darken)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textController,
                minLines: 7,
                maxLines: 8,
                decoration:
                    InputDecoration(filled: true, fillColor: Colors.white24),
              ),
              // TextButton(
              //   onPressed: () async {
              //     if (textController.text != '') {
              //       var secret =
              //           await SecretCatApi.addSecret(textController.text);
              //       if (secret != null) {
              //         Navigator.pop(context);
              //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //             content: Center(
              //                 child: Text('"${secret.secret}"를 외쳤습니다'))));
              //       }
              //     }
              //   },
              //   child: Text(
              //     "외치기",
              //     style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.white),
              //   ),
              // ),
            ],
          )),
    );
  }
}
