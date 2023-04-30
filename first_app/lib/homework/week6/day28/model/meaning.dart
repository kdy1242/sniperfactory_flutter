
import 'definition.dart';

class Meaning {
  String partOfSpeech;
  List<Definition> definitions;
  List<String> synonyms;
  List<String> antonyms;

  Meaning({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });
  
  factory Meaning.fromMap(Map<String, dynamic> map) {
    return Meaning(
      partOfSpeech: map['partOfSpeech'], 
      definitions: List<Definition>.from(map['definitions'].map((e) => Definition.fromMap(e))),
      synonyms: List<String>.from(map['synonyms']),
      antonyms: List<String>.from(map['antonyms']),
    );
  }
}
