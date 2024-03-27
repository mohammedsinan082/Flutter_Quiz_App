class QuestionModel{
  final List<OptionsModel> questions;
  final String topicId;
  final String topicName;


//<editor-fold desc="Data Methods">
  const QuestionModel({
    required this.questions,
    required this.topicId,
    required this.topicName
  });

  QuestionModel copyWith({
    List<OptionsModel>? questions,
    String? topicId,
    String? topicName
  }) {
    return QuestionModel(
      questions: questions ?? this.questions,
      topicId: topicId ?? this.topicId,
      topicName: topicName ?? this.topicName
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questions':  List<dynamic>.from(questions.map((x) => x.toJson())),
      'topicId': topicId,
      'topicName':topicName
    };
  }

  factory QuestionModel.fromJson(Map<String, dynamic> map) {
    return QuestionModel(
      questions:  map["questions"] == null ? [] : List<OptionsModel>.from(map["questions"]!.map((x) => OptionsModel.fromJson(x))),
      topicId: map['topicId']??"",
      topicName: map['topicName']??""
    );
  }

//</editor-fold>
}

class OptionsModel{
  final String question;
  final String option_A;
  final String option_B;
  final String option_C;
  final String option_D;
  final String answer;
   String submitted;

//<editor-fold desc="Data Methods">
   OptionsModel({
    required this.question,
    required this.option_A,
    required this.option_B,
    required this.option_C,
    required this.option_D,
    required this.answer,
    required this.submitted
  });

  OptionsModel copyWith({
    String? question,
    String? option_A,
    String? option_B,
    String? option_C,
    String? option_D,
    String? answer,
    String? submitted
  }) {
    return OptionsModel(
      question: question ?? this.question,
      option_A: option_A ?? this.option_A,
      option_B: option_B ?? this.option_B,
      option_C: option_C ?? this.option_C,
      option_D: option_D ?? this.option_D,
      answer: answer ?? this.answer,
      submitted: submitted ?? this.submitted,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'option_A': option_A,
      'option_B': option_B,
      'option_C': option_C,
      'option_D': option_D,
      'answer': answer,
      'submitted': submitted,
    };
  }

  factory OptionsModel.fromJson(Map<String, dynamic> map) {
    return OptionsModel(
      question: map['question'],
      option_A: map['option_A'],
      option_B: map['option_B'],
      option_C: map['option_C'],
      option_D: map['option_D'],
      answer: map['answer'],
      submitted: map['submitted'],
    );
  }

//</editor-fold>
}

// List<Question> questions = [
//   Question(
//     question: "What is the capital of India?",
//     a: "Mumbai",
//     b: "Punjab",
//     c: "New Delhi",
//     d: "Tamilnadu",
//     ans: "c",
//   ), Question(
//     question: "Who is the current Prime Minister of India?",
//     a: "Shri Arjun Munda",
//     b: "Narendra Modi",
//     c: "Shri Amit Shah",
//     d: "Shri Piyush Goyal",
//     ans: "b",
//   ), Question(
//     question: "Who heads the RBI?",
//     a: "Governor",
//     b: "Deputy Governor",
//     c: "Executive Director",
//     d: "Chief Financial Officer",
//     ans: "a",
//   ),
//   Question(
//     question: "Who is the current President of India?",
//     a: "Pranab Mukherjee",
//     b: "Droupadi Murmu",
//     c: "Ram Nath Kovind ",
//     d: "Narendra Modi",
//     ans: "b",
//   ),Question(
//     question: "When was India’s independence day?",
//     a: "15 August",
//     b: "5 June",
//     c: "26 January",
//     d: "2 October",
//     ans: "a",
//   ),Question(
//     question: "India’s space agency acronym?",
//     a: "ISRA",
//     b: "ICC",
//     c: "ISSA",
//     d: "ISRO",
//     ans: "d",
//   ),Question(
//     question: "Where is India’s Silicon Valley located?",
//     a: "Hyderabad",
//     b: "Mumbai",
//     c: "Banglore",
//     d: "Chennai",
//     ans: "c",
//   ),Question(
//     question: "What is the currency of India?",
//     a: "Dollar",
//     b: "Rupees",
//     c: "Rupess",
//     d: "Euro",
//     ans: "b",
//   ),Question(
//     question: "Premier tech institute in India?",
//     a: "IIT (Indian Institutes of Technology)",
//     b: "NIT (National Institutes of Technology)",
//     c: "IIIT (Indian Institutes of Information Technology)",
//     d: "BITS (Birla Institute of Technology and Science)",
//     ans: "a",
//   ),
//
//   // Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),Question(
//   //   question: "What is the currency of India?",
//   //   a: "Dollar",
//   //   b: "Rupees",
//   //   c: "Rupess",
//   //   d: "Euro",
//   //   ans: "Bharat paise",
//   // ),
// ];































// class Answer{
//   final String answerText;
//   final bool iscorrect;
//
//   Answer(this.answerText,this.iscorrect);
// }
//
//
// List<Question> getQuestions(){
//   List<Question> list=[];
//   list.add(
//     Question("Who is the owner of flutter?",
//     [
//       Answer('Google', true),
//       Answer('Apple', false),
//       Answer('Nokia', false),
//       Answer('Samsung', false),
//     ]
//     ));
//
//   list.add(
//       Question("Who is the founder of flutter",
//           [
//             Answer('jamis Tamplin', false),
//             Answer('James Tamplin', true),
//             Answer('Kunji Moideen', false),
//             Answer('Abdul Majeed', false),
//           ]
//       ));
//
//   list.add(
//       Question("In which year Flutter published",
//           [
//             Answer('2001', false),
//             Answer('2011', true),
//             Answer('1888', false),
//             Answer('BC 15', false),
//           ]
//       ));
//
//   list.add(
//       Question("Which of them is not a datatype",
//           [
//             Answer('int', false),
//             Answer('String', false),
//             Answer('double', false),
//             Answer('Jalal', true),
//           ]
//       ));
//
//   list.add(
//       Question("Flutter is a _____________",
//           [
//             Answer('tv', false),
//             Answer('Fruit', false),
//             Answer('Frame Work', true),
//             Answer('Sports car', false),
//           ]
//       ));
//
//
//
//   return list;
// }
