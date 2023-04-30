
import 'package:flutter/material.dart';

import '../model/dict.dart';

class MeaningCard extends StatelessWidget {
  const MeaningCard({Key? key, required this.word}) : super(key: key);

  final Dict word;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white10,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(word.word, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                for (var meaning in word.meanings)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(meaning.partOfSpeech, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('- Synonyms:'),
                        for (var synonym in meaning.synonyms) Text(synonym),
                        SizedBox(height: 8),
                        Text('- Definitions:'),
                        for (var definition in meaning.definitions) Text(definition.definition),
                        SizedBox(height: 8),
                        Text('- Antonyms:'),
                        for (var antonym in meaning.antonyms) Text(antonym),
                        Divider(),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

