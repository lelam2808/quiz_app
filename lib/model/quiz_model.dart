

import 'dart:convert';

List<Quizz> getQuizzFromJson(String str) => List<Quizz>.from(json.decode(str).map((x) => Quizz.fromJson(x)));
class Quizz {
  late int responseCode;
  late List<Results> results;

  Quizz({required this.responseCode, required this.results});

  Quizz.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  late String category;
  late String type;
  late String difficulty;
  late String question;
  late String correctAnswer;
  late List<String> incorrectAnswers;

  Results(
      {required this.category,
        required this.type,
        required this.difficulty,
        required this.question,
        required this.correctAnswer,
        required this.incorrectAnswers});

  Results.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    type = json['type'];
    difficulty = json['difficulty'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    incorrectAnswers = json['incorrect_answers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['type'] = this.type;
    data['difficulty'] = this.difficulty;
    data['question'] = this.question;
    data['correct_answer'] = this.correctAnswer;
    data['incorrect_answers'] = this.incorrectAnswers;
    return data;
  }
}