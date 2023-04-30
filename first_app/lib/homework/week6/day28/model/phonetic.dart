
import 'license.dart';

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
