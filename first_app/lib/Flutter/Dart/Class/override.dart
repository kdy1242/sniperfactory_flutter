
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

  @override
  String toString() => 'Word($word / $meaning / $example)';

  // 두 개의 Word 객체의 word 값 비교
  @override
  bool operator ==(Object other) {
    if(other is Word) {
      return word == other.word;
    }
    return false;
  }
}

void main() {
  Word wordA = Word(word: 'Apple', meaning: '사과', example: 'Give me an apple');
  Word wordB = Word(word: 'Apple', meaning: '사과', example: 'Give me an apple');

  print(wordA == wordB);  // true
}
