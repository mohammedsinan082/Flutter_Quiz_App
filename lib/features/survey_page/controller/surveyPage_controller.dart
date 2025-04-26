import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_quiz_app/features/survey_page/repository/surveypage_repository.dart';
import 'package:flutter_quiz_app/models/quiz_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final SurveyPageControllerProvider=StateNotifierProvider<SurveyPageController,bool>((ref) {
  return SurveyPageController(surveyPageRepository: ref.watch(SurveyRepositoryProvider));
});

class SurveyPageController extends StateNotifier<bool>{
  final SurveyPageRepository _surveyPageRepository;
    SurveyPageController({required SurveyPageRepository surveyPageRepository}):_surveyPageRepository=surveyPageRepository,super(false);


  updateData({required quizId,required questions}) async{
    state=true;
    final res=await _surveyPageRepository.updateData(quizId: quizId, questions: questions);
    state=false;

    res.fold((l) => 'error', (r) => 'success');
  }

  createExam({required QuizModel quizModel}){
    final data=_surveyPageRepository.createExam(quizModel: quizModel);
    return data;
  }
}