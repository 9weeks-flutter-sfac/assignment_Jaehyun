// ignore_for_file: prefer_const_constructors

import 'package:assignment2/Model/profile.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.profile});
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    var id = profile.id;
    var name = profile.name;
    var phone = profile.phone;
    var address = profile.address;
    var email = profile.email;
    var website = profile.website;
    // var id = profile.id;
    var imgUrl =
        "https://xsgames.co/randomusers/assets/avatars/male/${profile.id}.jpg";
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(profile.name),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(clipBehavior: Clip.none, children: [
              Image.network(imgUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 320,
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black45),
              Positioned(
                bottom: -48,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage(imgUrl),
                  ),
                ),
              )
            ]),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  Text(
                    phone,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    address.street,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
