import 'dart:convert';

import 'package:equatable/equatable.dart';

class RiddleResponse extends Equatable {
  final String? title;
  final String? question;
  final String? answer;

  const RiddleResponse({this.title, this.question, this.answer});

  factory RiddleResponse.fromMap(Map<String, dynamic> data) {
    return RiddleResponse(
      title: data['title'] as String?,
      question: data['question'] as String?,
      answer: data['answer'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'title': title,
        'question': question,
        'answer': answer,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RiddleResponse].
  factory RiddleResponse.fromJson(String data) {
    return RiddleResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RiddleResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  RiddleResponse copyWith({
    String? title,
    String? question,
    String? answer,
  }) {
    return RiddleResponse(
      title: title ?? this.title,
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [title, question, answer];
}
