import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/core/providers/firebase_provider.dart';
import 'package:flutter_quiz_app/features/auth/screens/signup_page.dart';
import 'package:flutter_quiz_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/Riverpod_constants.dart';
import '../../../core/constants/sharedpreferconstants.dart';
import '../../../core/failure.dart';
import '../../../core/type_defs.dart';
import '../../../models/user_model.dart';

final authRepositoryProvider=Provider((ref) => AuthRepository(
      firestore: ref.read(firestoreProvider),
      auth: ref.read(authProvider),
      googleSignIn: ref.read(googleSignInProvider),
      ref: ref)
);

class AuthRepository{
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final Ref _ref;

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
    required Ref ref
}):_firestore=firestore,
  _auth=auth,
  _ref=ref,
  _googleSignIn=googleSignIn;

  CollectionReference get _user => _firestore.collection(RiverpodConstants.user);
  Stream<User?> get authStateChange => _auth.authStateChanges();


  FutureEither<UserModel> signInWithGoogle() async {

    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("login",true);

      final   GoogleSignInAccount? googleUser= await GoogleSignIn().signIn();
      final   GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final  AuthCredential credential=GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken:googleAuth?.idToken
      );




      UserCredential userCredential= await FirebaseAuth.instance.signInWithCredential(credential);


      currentuseremail=userCredential.user!.email ?? "No Email";
      currentuserid=userCredential.user!.uid;
      currentuserid=userCredential.user!.displayName?? "No Name";
      //****************************************************\\
      prefs.setString(SharedPreferConstants.userEmail,currentuseremail);
      prefs.setString(SharedPreferConstants.userId,currentuserid);
      prefs.setString(SharedPreferConstants.userName,currentusername);

      UserModel userModel;
      var userData=await  _firestore.collection(RiverpodConstants.user).where('id',isEqualTo: currentuserid).get();
      if (userData.docs.isEmpty) {
        DocumentReference reference = _ref.read(firestoreProvider).collection(RiverpodConstants.user).doc(userCredential.user!.uid);
        userModel =UserModel(
          email: userCredential.user!.email?? "no email",
          id: userCredential.user!.uid,
          delete: false,
          date: DateTime.now(),
          name: userCredential.user!.displayName?? "no name",
          reference: reference,
        );
        await _user.doc(userCredential.user!.uid).set(userModel.toJson());
      } else {
        print("goggggggle");
        print(userCredential.user?.uid);
        print("goggggggle");
        userModel = UserModel.fromJson(userData.docs.first.data());
      }
      return right(userModel);
    } on FirebaseException catch (e){
      throw e.message!;
    } catch (e){
      return left(Failure(e.toString()));
    }

  }


}