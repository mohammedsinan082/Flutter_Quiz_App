
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_quiz_app/core/constants/Riverpod_constants.dart';
import 'package:flutter_quiz_app/models/quiz_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/constants/type_defs.dart';
import '../../../core/failure.dart';

final SurveyRepositoryProvider=Provider((ref) {
  return SurveyPageRepository(firestore: FirebaseFirestore.instance);
});

class SurveyPageRepository{
  FirebaseFirestore _firestore;
  SurveyPageRepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _quiz=> _firestore.collection(RiverpodConstants.quiz);


  FutureVoid updateData({required quizId,required questions}) async{
    try{
      return right(
   //   _product.doc(model.id).update(model.toJson()));
        _quiz.doc(quizId).update({
          "questions":List.generate(questions.length, (index) => questions[index].toJson())
        }));
    } on FirebaseException catch (em) {
      throw em.message!;
    }catch (e) {
      return throw Exception(Failure(e.toString()));
    }
  }

  createExam({required QuizModel quizModel})async{
    try{
     final data=await FirebaseFirestore.instance.collection(RiverpodConstants.quiz).doc();
     quizModel.quizId=data.id;
     data.set(quizModel.toJson());
    }catch(e){
      throw Exception(e.toString());
    }
  }


}