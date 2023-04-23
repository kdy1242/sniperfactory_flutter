
class Word {
  String word;
  String meaning;
  String example;

  // 기본 생성자
  Word({
    required this.word,
    required this.meaning,
    required this.example,
  });

  // 이름 있는 생성자 (fromMap)
  Word.fromMap(Map<String, dynamic> map)
    : word = map['word'],
      meaning = map['meaning'],
      example = map['example'];

  // 멤버 함수 (toMap)
  Map<String, dynamic> toMap() => {
    'word': word,
    'meaning': meaning,
    'example': example,
  };

  @override
  String toString() => 'Word($word / $meaning / $example)';

}

void main() {
  Map<String, dynamic> networkData = {
    'word': 'Apple',
    'meaning': '사과',
    'example': 'can i get an apple?',
  };

  var word = Word.fromMap(networkData);
  print(word);  // Word(Apple / 사과 / can i get an apple?)
  print(word.toMap());  // {word: Apple, meaning: 사과, example: can i get an apple?}
}
