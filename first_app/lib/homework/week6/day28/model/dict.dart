
import 'phonetic.dart';
import 'meaning.dart';
import 'license.dart';

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
