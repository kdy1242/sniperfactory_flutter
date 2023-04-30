
import 'package:dio/dio.dart';

class Dict {
  String word;
  String? phonetic;
  List<Phonetic> phonetics;
  List<Meaning> meanings;
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

  factory Dict.fromMap(Map<String, dynamic> map) {
    return Dict(
      word: map['word'],
      phonetic: map['phonetic'],
      phonetics: List<Phonetic>.from(map['phonetics'].map((e) => Phonetic.fromMap(e))),
      meanings: List<Meaning>.from(map['meanings'].map((e) => Meaning.fromMap(e))),
      license: License.fromMap(map['license']),
      sourceUrls: List<String>.from(map['sourceUrls']),
    );
  }
}

class License {
  String name;
  String url;

  License({
    required this.name,
    required this.url,
  });

  factory License.fromMap(Map<String, dynamic> map) {
    return License(
      name: map['name'],
      url: map['url'],
    );
  }
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

  factory Phonetic.fromMap(Map<String, dynamic> map) {
    return Phonetic(
      text: map['text'],
      audio: map['audio'],
      sourceUrl: map['sourceUrl'],
      license: map['license'] != null ? License.fromMap(map['license']) : null,
    );
  }
}

class Meaning {
  String partOfSpeech;
  List<Definition> definitions;

  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  factory Meaning.fromMap(Map<String, dynamic> map) {
    return Meaning(
      partOfSpeech: map['partOfSpeech'],
      definitions: List<Definition>.from(map['definitions'].map((e) => Definition.fromMap(e))),
    );
  }
}

class Definition {
  String definition;
  List<String> synonyms;
  List<String> antonyms;
  String? example;

  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    required this.example,
  });

  factory Definition.fromMap(Map<String, dynamic> map) {
    return Definition(
      definition: map['definition'],
      synonyms: List<String>.from(map['synonyms']),
      antonyms: List<String>.from(map['antonyms']),
      example: map['example'],
    );
  }
}

void main() async {
  Dio dio = Dio();
  String search = 'run';
  String url = 'https://api.dictionaryapi.dev/api/v2/entries/en/$search';
  var res = await dio.get(url);
  var dict = Dict.fromMap(res.data.first);
  print(dict);
}
