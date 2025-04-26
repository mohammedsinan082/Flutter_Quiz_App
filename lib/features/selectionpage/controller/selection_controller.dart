import 'package:flutter_quiz_app/features/selectionpage/repository/selection_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/question_model.dart';

final SelectionControllerProvider=StateNotifierProvider<SelectionController,bool>((ref) =>
    SelectionController(repository: ref.read(SelectionRepositoryProvider)));


final viewSelectedProvider=StreamProvider.autoDispose((ref) {
  return ref.watch(SelectionControllerProvider.notifier).viewSelected();
});

class SelectionController extends StateNotifier<bool>{

  final SelectionRepository _repository;

  SelectionController({required SelectionRepository repository}):_repository=repository,super(false);


  Stream<List<QuestionModel>> viewSelected(){
   return _repository.viewSelected();
  }

}