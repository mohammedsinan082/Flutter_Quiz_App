import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_quiz_app/core/constants/type_defs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/constants/Riverpod_constants.dart';
import '../../../models/question_model.dart';

final SelectionRepositoryProvider=Provider((ref) {
  return SelectionRepository(firestore: FirebaseFirestore.instance);
});

class SelectionRepository{
  final FirebaseFirestore _firestore;
  SelectionRepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _selected => _firestore.collection(RiverpodConstants.questions);



   Stream<List<QuestionModel>> viewSelected(){

      return _selected.snapshots().map((event) {
       return event.docs.map((e) {
          return QuestionModel.fromJson(e.data() as Map<String,dynamic>);
        }).toList();
     });

   }








}