// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class hi {
  final String id;
  final String age;
  final String name;
  final String createdAt;
  final String updatedAt;

  final String director;
  final String year;
  final String rating;
  hi({
    required this.id,
    required this.age,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.director,
    required this.year,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'age': age,
      'name': name,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'id': id,
      'director': director,
      'year': year,
      'rating': rating,
    };
  }

  factory hi.fromMap(Map<String, dynamic> map) {
    return hi(
      age: map['age'] as String,
      name: map['name'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      id: map['id'] as String,
      director: map['director'] as String,
      year: map['year'] as String,
      rating: map['rating'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory hi.fromJson(String source) =>
      hi.fromMap(json.decode(source) as Map<String, dynamic>);
}
