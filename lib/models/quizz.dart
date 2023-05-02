// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Question {
  String questionText;
  String answr;
  List suggestions;

  Question(
    this.questionText,
    this.answr,
    this.suggestions,
  );

  Question copyWith({
    String? questionText,
    String? answr,
    List? suggestions,
  }) {
    return Question(
      questionText ?? this.questionText,
      answr ?? this.answr,
      suggestions ?? this.suggestions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'questionText': questionText,
      'answr': answr,
      'suggestions': suggestions,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
        map['questionText'] as String,
        map['answr'] as String,
        List.from(
          (map['suggestions'] as List),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Question(questionText: $questionText, answr: $answr, suggestions: $suggestions)';

  @override
  bool operator ==(covariant Question other) {
    if (identical(this, other)) return true;

    return other.questionText == questionText &&
        other.answr == answr &&
        listEquals(other.suggestions, suggestions);
  }

  @override
  int get hashCode =>
      questionText.hashCode ^ answr.hashCode ^ suggestions.hashCode;
}
