// import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:assignment2/controller/secret_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var bgImgUrl =
    "https://images.unsplash.com/photo-1478098711619-5ab0b478d6e6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80";

class SecretPage extends GetView<SecretController> {
  const SecretPage({Key? key}) : super(key: key);
  static const String route = '/secret';

  @override
  Widget build(BuildContext context) {
    final textStlye = TextStyle(
        fontSize: 24, color: Colors.white70, fontWeight: FontWeight.bold);

    var textcolor = Colors.white70;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "뒤로가기",
          style: TextStyle(color: textcolor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: textcolor),
      ),
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(bgImgUrl),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black54, BlendMode.darken)),
          ),
          child: Obx(() {
            if (controller.secrets?.isEmpty ?? true) {
              return CircularProgressIndicator();
            } else {
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.secrets?.length,
                itemBuilder: (context, index) {
                  var secret = controller.secrets?[index];

                  return FadeInRight(
                    duration: Duration(milliseconds: 150),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          secret?.secret ?? "",
                          style: textStlye,
                        ),
                        SizedBox(height: 16),
                        Text(
                          secret?.authorName ?? "익명",
                          style:
                              textStlye.copyWith(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          })
          // child: FutureBuilder(
          //   future: SecretCatApi.fetchSecrets(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       var reverseList = snapshot.data!.reversed.toList();
          //       print(reverseList.length);
          //       return PageView.builder(
          //         scrollDirection: Axis.vertical,
          //         itemCount: snapshot.data?.length,
          //         itemBuilder: (context, index) {
          //           return FadeInRight(
          //             duration: Duration(milliseconds: 150),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   reverseList[index].secret,
          //                   style: TextStyle(
          //                       fontSize: 16,
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //                 SizedBox(
          //                   height: 16,
          //                 ),
          //                 Text(
          //                   reverseList[index].author?.username ?? "익명",
          //                   style: TextStyle(
          //                       fontSize: 16,
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold),
          //                 ),
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
