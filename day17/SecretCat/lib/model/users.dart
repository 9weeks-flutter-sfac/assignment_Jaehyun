// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Users {
  int page;
  int perPage;
  int totalPages;
  int totalItems;
  List<User> items;
  Users({
    required this.page,
    required this.perPage,
    required this.totalPages,
    required this.totalItems,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'perPage': perPage,
      'totalPages': totalPages,
      'totalItems': totalItems,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      page: map['page'] as int,
      perPage: map['perPage'] as int,
      totalPages: map['totalPages'] as int,
      totalItems: map['totalItems'] as int,
      items: List<User>.from(
        (map['items'] as List<int>).map<User>(
          (x) => User.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) =>
      Users.fromMap(json.decode(source) as Map<String, dynamic>);
}

class User {
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  String username;
  bool verified;
  bool emailVisibility;
  String email;
  String name;
  String avatar;
  User({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.username,
    required this.verified,
    required this.emailVisibility,
    required this.email,
    required this.name,
    required this.avatar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created.millisecondsSinceEpoch,
      'updated': updated.millisecondsSinceEpoch,
      'username': username,
      'verified': verified,
      'emailVisibility': emailVisibility,
      'email': email,
      'name': name,
      'avatar': avatar,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      collectionId: map['collectionId'] as String,
      collectionName: map['collectionName'] as String,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
      updated: DateTime.fromMillisecondsSinceEpoch(map['updated'] as int),
      username: map['username'] as String,
      verified: map['verified'] as bool,
      emailVisibility: map['emailVisibility'] as bool,
      email: map['email'] as String,
      name: map['name'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
