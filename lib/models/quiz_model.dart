import 'package:flutter_quiz_app/models/question_model.dart';

class QuizModel{
  final List<OptionsModel> questions;
  final String topicId;
  final String topicName;
  final String userId;
  String?quizId;


//<editor-fold desc="Data Methods">
   QuizModel({
    required this.questions,
    required this.topicId,
    required this.topicName,
    required this.userId,
    this.quizId,
  });

  QuizModel copyWith({
    List<OptionsModel>? questions,
    String? topicId,
    String? topicName,
    String? userId,
  }) {
    return QuizModel(
        questions: questions ?? this.questions,
        topicId: topicId ?? this.topicId,
        topicName: topicName ?? this.topicName,
        userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questions':  List<dynamic>.from(questions.map((x) => x.toJson())),
      'topicId': topicId,
      'topicName':topicName,
      'userId':userId,
      "quizId":quizId
    };
  }

  factory QuizModel.fromJson(Map<String, dynamic> map) {
    return QuizModel(
        questions:  map["questions"] == null ? [] : List<OptionsModel>.from(map["questions"]!.map((x) => OptionsModel.fromJson(x))),
        topicId: map['topicId']??"",
        topicName: map['topicName']??"",
        userId: map['userId']??"",
      quizId: map["quizId"]??""
    );
  }

//</editor-fold>
}
