import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/features/auth/screens/signup_page.dart';
import 'package:flutter_quiz_app/images.dart';
import 'package:flutter_quiz_app/survey_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';
import 'models/question_model.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {


  signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('login',false);
    prefs.remove('id');
    await GoogleSignIn().signOut().then((value) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  SignupPage()), (route) => false);
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: h*1,
        width: w*1,
        decoration: BoxDecoration(
          gradient:LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.blue.shade900,Colors.blue.shade600,Colors.blue.shade400,Colors.white10,]),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height:h*0.65,
              width: w*0.8,
             // color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Click to Start",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white70)),
                  
                  StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('questions').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      List<DocumentSnapshot> data = snapshot.data?.docs??[];

                      List<QuestionModel> questions = [];

                      return Container(
                        height: h*0.45,
                        width: w*0.6,
                       // color: Colors.red,
                        child: ListView.separated(
                          itemCount: data.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: h*0.06,);
                            },
                            itemBuilder: (context, index) {
                              for(var doc in data){
                                questions.add(QuestionModel.fromJson(doc.data() as  Map<String,dynamic>));
                              }
                              return InkWell(
                                onTap: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => survey_home_page(questionModel: questions[index],),));
                                },
                                child: Container(
                                    height:h*0.07,
                                    width: w*0.6,
                                    decoration: BoxDecoration(
                                        color: Colors.white70,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: h*0.06,
                                          width: w*0.2,
                                          color: Colors.transparent,
                                          child: Image.asset(questions[index].topicName == 'Firebase'?Pictures.firebase:questions[index].topicName == 'Flutter'?Pictures.flutter: Pictures.dart),

                                        ),
                                        Text(questions[index].topicName == 'Firebase'?"Firebase":questions[index].topicName == 'Flutter'? "Flutter":"Dart",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 35,)),
                                      ],
                                    )
                                ),
                              );
                            },
                        ),
                      );
                    }
                  ),
                  // InkWell(
                  //   onTap: () {
                  //
                  //   },
                  //   child: Container(
                  //     height:h*0.07,
                  //     width: w*0.6,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white70,
                  //       borderRadius: BorderRadius.circular(10)
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Container(
                  //           height: h*0.06,
                  //           width: w*0.2,
                  //           color: Colors.transparent,
                  //           child: Image.asset(Pictures.dart),
                  //
                  //         ),
                  //         Text("Dart",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 35,),),
                  //       ],
                  //     )
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //
                  //   },
                  //   child: Container(
                  //     height:h*0.07,
                  //     width: w*0.6,
                  //       decoration: BoxDecoration(
                  //           color: Colors.white70,
                  //           borderRadius: BorderRadius.circular(10)
                  //       ),
                  //       child: Row(
                  //         children: [
                  //           Container(
                  //             height: h*0.05,
                  //             width: w*0.2,
                  //             color: Colors.transparent,
                  //             child: Image.asset(Pictures.flutter),
                  //
                  //           ),
                  //           Text("Flutter",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 35,),),
                  //         ],
                  //       )
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //
                  //   },
                  //   child: Container(
                  //     height:h*0.07,
                  //     width: w*0.6,
                  //       decoration: BoxDecoration(
                  //           color: Colors.white70,
                  //           borderRadius: BorderRadius.circular(10)
                  //       ),
                  //       child: Row(
                  //         children: [
                  //           Container(
                  //             height: h*0.05,
                  //             width: w*0.2,
                  //             color: Colors.transparent,
                  //             child: Image.asset(Pictures.firebase),
                  //
                  //           ),
                  //           Text("Firebase",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 35,),),
                  //         ],
                  //       )
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {
                     signOut();
                    },
                    child: Container(
                        height:h*0.07,
                        width: w*0.7,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text("Sign out",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 35,)))),
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
