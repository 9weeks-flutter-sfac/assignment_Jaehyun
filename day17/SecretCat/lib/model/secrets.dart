import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Secrets {
  int page;
  int perPage;
  int totalPages;
  int totalItems;
  List<Secret> items;
  Secrets({
    required this.page,
    required this.perPage,
    required this.totalPages,
    required this.totalItems,
    required this.items,
  });

  get secrets => null;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'perPage': perPage,
      'totalPages': totalPages,
      'totalItems': totalItems,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory Secrets.fromMap(Map<String, dynamic> map) {
    return Secrets(
      page: map['page'],
      perPage: map['perPage'],
      totalPages: map['totalPages'],
      totalItems: map['totalItems'],
      items: List<Secret>.from(
        (map['items']).map<Secret>(
          (x) => Secret.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Secrets.fromJson(String source) =>
      Secrets.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Secret {
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  String secret;
  String author;
  String authorName;
  Secret({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.secret,
    required this.author,
    required this.authorName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created.millisecondsSinceEpoch,
      'updated': updated.millisecondsSinceEpoch,
      'secret': secret,
      'author': author,
      'authorName': authorName,
    };
  }

  factory Secret.fromMap(Map<String, dynamic> map) {
    return Secret(
      id: map['id'],
      collectionId: map['collectionId'],
      collectionName: map['collectionName'],
      created: DateTime.parse(map['created']),
      updated: DateTime.parse(map['updated']),
      secret: map['secret'] ?? "",
      author: map['author'] ?? "익명",
      authorName: map['authorName'] ?? "익명",
    );
  }

  String toJson() => json.encode(toMap());

  factory Secret.fromJson(String source) =>
      Secret.fromMap(json.decode(source) as Map<String, dynamic>);
}
