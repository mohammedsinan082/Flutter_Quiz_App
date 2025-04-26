import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/features/selectionpage/screens/selection_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/providers/providers.dart';
import '../repository/auth_repository.dart';

final authControllerProvider=StateNotifierProvider<AuthController,bool>((ref) =>
AuthController(
    authRepository: ref.read(authRepositoryProvider),
    ref: ref)
);

class AuthController extends StateNotifier<bool>{
  final AuthRepository _authRepository;
  final Ref _ref;

  AuthController({
    required AuthRepository authRepository,
    required Ref ref
   }):_authRepository=authRepository, _ref=ref, super(false);



  Stream<User?> get authStateChange => _authRepository.authStateChange;

  void signInWithGoogle(BuildContext context) async {
    state = true;
    final user = await _authRepository.signInWithGoogle();
    state = false;

    user.fold((l) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l.message)));
      print(l.message);
      print("++++++++++++++++");
    },(r) async {
      print(r.toJson());
      var prefs = await _ref.watch(sharedPrefsProvider.future);
      prefs.setString("id", r.id);

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SelectionPage(),), (route) => false);
    });



    // (l) => showSnackBar(context, l.message),
    // (userModel) {
    //    _ref.read(userProvider.notifier).update((state) => userModel);
    //    Navigator.push(context, MaterialPageRoute(builder: (context) => homePage(),));
    // },
    //  );
  }





}