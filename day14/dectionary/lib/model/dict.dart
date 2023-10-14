import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Dict {
  String word;
  String? phonetic;
  List<Phonetic> phonetics;
  List<Meanings> meanings;
  License license;
  List<String> sourceUrls;
  Dict({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'phonetic': phonetic,
      'phonetics': phonetics.map((x) => x.toMap()).toList(),
      'meanings': meanings.map((x) => x.toMap()).toList(),
      'license': license.toMap(),
      'sourceUrls': sourceUrls,
    };
  }

  factory Dict.fromMap(Map<String, dynamic> map) {
    return Dict(
      word: map['word'] as String,
      phonetic: map['phonetic'],
      phonetics: List<Phonetic>.from(
        map['phonetics'].map<Phonetic>(
          (x) => Phonetic.fromMap(x as Map<String, dynamic>),
        ),
      ),
      meanings: List<Meanings>.from(
        (map['meanings']).map<Meanings>(
          (x) => Meanings.fromMap(x as Map<String, dynamic>),
        ),
      ),
      license: License.fromMap(map['license'] as Map<String, dynamic>),
      sourceUrls: List<String>.from(map['sourceUrls']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Dict.fromJson(String source) =>
      Dict.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Phonetic {
  String? text;
  String audio;
  String? sourceUrl;
  License? license;
  Phonetic({
    required this.text,
    required this.audio,
    required this.sourceUrl,
    required this.license,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'audio': audio,
      'sourceUrl': sourceUrl,
      'license': license?.toMap(),
    };
  }

  factory Phonetic.fromMap(Map<String, dynamic> map) {
    return Phonetic(
      text: map['text'] != null ? map['text'] : null,
      audio: map['audio'] as String,
      sourceUrl: map['sourceUrl'] != null ? map['sourceUrl'] : null,
      license: map['license'] != null
          ? License.fromMap(map['license'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Phonetic.fromJson(String source) =>
      Phonetic.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Meanings {
  String partOfSpeech;
  List<Definition> definitions;
  List<String>? synonyms;
  List<String>? antonyms;
  Meanings({
    required this.partOfSpeech,
    required this.definitions,
    this.synonyms,
    this.antonyms,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'partOfSpeech': partOfSpeech,
      'definitions': definitions.map((x) => x.toMap()).toList(),
      'synonyms': synonyms,
      'antonyms': antonyms,
    };
  }

  factory Meanings.fromMap(Map<String, dynamic> map) {
    return Meanings(
      partOfSpeech: map['partOfSpeech'] as String,
      definitions: List<Definition>.from(
        (map['definitions']).map<Definition>(
          (x) => Definition.fromMap(x as Map<String, dynamic>),
        ),
      ),
      synonyms:
          map['synonyms'] != null ? List<String>.from(map['synonyms']) : null,
      antonyms:
          map['antonyms'] != null ? List<String>.from(map['antonyms']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meanings.fromJson(String source) =>
      Meanings.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Definition {
  String definition;
  List<String>? synonyms;
  List<String>? antonyms;
  String? example;
  Definition({
    required this.definition,
    this.synonyms,
    this.antonyms,
    this.example,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'definition': definition,
      'synonyms': synonyms,
      'antonyms': antonyms,
      'example': example,
    };
  }

  factory Definition.fromMap(Map<String, dynamic> map) {
    return Definition(
      definition: map['definition'] as String,
      synonyms:
          map['synonyms'] != null ? List<String>.from((map['synonyms'])) : null,
      antonyms:
          map['antonyms'] != null ? List<String>.from((map['antonyms'])) : null,
      example: map['example'] != null ? map['example'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Definition.fromJson(String source) =>
      Definition.fromMap(json.decode(source) as Map<String, dynamic>);
}

class License {
  String name;
  String url;
  License({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory License.fromMap(Map<String, dynamic> map) {
    return License(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory License.fromJson(String source) =>
      License.fromMap(json.decode(source) as Map<String, dynamic>);
}
