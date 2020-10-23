import 'package:flutter/material.dart';

import 'package:mvc_pattern/mvc_pattern.dart';

import 'package:english_words/english_words.dart';

class Model {
  final List<String> _suggestions = [];

  int get length => _suggestions.length;

  String wordPair(int index) {
    if (index == null || index < 0) {
      index = 0;
    }
    return _suggestions[index];
  }

  bool contains(String pair) {
    if (pair == null || pair.isEmpty) {
      return false;
    }
    return _saved.contains(pair);
  }

  final Set<String> _saved = {};

  void save(String pair) {
    if (pair == null || pair.isEmpty) {
      return;
    }

    final alreadySaved = contains(pair);

    if (alreadySaved) {
      _saved.remove(pair);
    } else {
      _saved.add(pair);
    }
  }

  Iterable<ListTile> saved<ListTile>(Function f) => _saved.map(f);

  Iterable<String> wordPairs([int count = 10]){
    return makeWordPairs(count);
  }

  void addAll(int count) {
    _suggestions.addAll(wordPairs(count));
  }
}

Iterable<String> makeWordPairs(int count) {
  /// Uncomment the import statement above and the line below to try this example.
  /// Of course, that means you'll have to modify your pubspec.yaml
 return generateWordPairs().take(count).map((pair){return pair.asPascalCase;});
}

