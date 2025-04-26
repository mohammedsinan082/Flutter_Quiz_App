import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_quiz_app/features/auth/screens/signup_page.dart';
import 'package:flutter_quiz_app/core/constants/images.dart';
import 'package:flutter_quiz_app/features/survey_page/screens/survey_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/selection_controller.dart';
import '../../../main.dart';
import '../../../models/question_model.dart';

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
          image: DecorationImage(
              image: AssetImage(Pictures.zzzz),fit: BoxFit.fill),
          // gradient: LinearGradient(
          //     begin: Alignment.bottomRight,
          //     end: Alignment.topRight,
          //     colors: <Color>[Colors.black12, Colors.green])
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
                  // Text("Click to Start",style: TextStyle(fontWeight: FontWeight.bold,fontSize: w*0.1,color: Colors.black87,)),
                  Animate(
                      effects: [FadeEffect(duration: 1000.ms),SlideEffect()],
                      child: Text("Click to Start",style: GoogleFonts.aboreto(fontSize: w*0.080,fontWeight: FontWeight.w600,color: Colors.white))),

                 Consumer(
                   builder: (context,ref,child) {
                     return ref.watch(viewSelectedProvider).when(
                         data: (data) {
                           return Container(
                             height: h*0.45,
                             width: w*0.6,
                             // color: Colors.red,
                             child:
                             ListView.separated(
                               itemCount: data.length,
                               separatorBuilder: (context, index) {
                                 return SizedBox(height: h*0.06,);
                               },
                               itemBuilder: (context, index) {
                                 // for(var doc in data){
                                 //   questions.add(QuestionModel.fromJson(doc.data() as  Map<String,dynamic>));
                                 // }
                                 return InkWell(
                                   onTap: () {
                                     Navigator.of(context).push(PageAnimationTransition(page: survey_home_page(questionModel: data[index]), pageAnimationType:LeftToRightFadedTransition()));
                                     //    Navigator.push(context, MaterialPageRoute(builder: (context) => survey_home_page(questionModel: questions[index],),));
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
                                             child: Image.asset(data[index].topicName == 'Firebase'?Pictures.firebase:data[index].topicName == 'Flutter'?Pictures.flutter: Pictures.dart),

                                           ),
                                           Animate(
                                               effects: [FadeEffect(duration: 1000.ms),SlideEffect()],
                                               child: Text(data[index].topicName == 'Firebase'?"Firebase":data[index].topicName == 'Flutter'? "Flutter":"Dart",style: GoogleFonts.nunitoSans(fontSize: w*0.070,fontWeight: FontWeight.w600))),
                                         ],
                                       )
                                   ),
                                 );
                               },
                             ),
                           );

                         },
                       error: (error, stackTrace) => Text(error.toString()),
                       loading: () => Center(child: CircularProgressIndicator()));

                   }

                 ),

                  // StreamBuilder(
                  //   stream: FirebaseFirestore.instance.collection('questions').snapshots(),
                  //   builder: (context, snapshot) {
                  //     if (!snapshot.hasData) {
                  //       return Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }
                  //
                  //     List<DocumentSnapshot> data = snapshot.data?.docs??[];
                  //
                  //     List<QuestionModel> questions = [];
                  //
                  //     return Container(
                  //       height: h*0.45,
                  //       width: w*0.6,
                  //      // color: Colors.red,
                  //       child: ListView.separated(
                  //         itemCount: data.length,
                  //           separatorBuilder: (context, index) {
                  //             return SizedBox(height: h*0.06,);
                  //           },
                  //           itemBuilder: (context, index) {
                  //             for(var doc in data){
                  //               questions.add(QuestionModel.fromJson(doc.data() as  Map<String,dynamic>));
                  //             }
                  //             return InkWell(
                  //               onTap: () {
                  //                 Navigator.of(context).push(PageAnimationTransition(page: survey_home_page(questionModel: questions[index]), pageAnimationType:LeftToRightFadedTransition()));
                  //            //    Navigator.push(context, MaterialPageRoute(builder: (context) => survey_home_page(questionModel: questions[index],),));
                  //               },
                  //               child: Container(
                  //                   height:h*0.07,
                  //                   width: w*0.6,
                  //                   decoration: BoxDecoration(
                  //                       color: Colors.white70,
                  //                       borderRadius: BorderRadius.circular(10)
                  //                   ),
                  //                   child: Row(
                  //                     children: [
                  //                       Container(
                  //                         height: h*0.06,
                  //                         width: w*0.2,
                  //                         color: Colors.transparent,
                  //                         child: Image.asset(questions[index].topicName == 'Firebase'?Pictures.firebase:questions[index].topicName == 'Flutter'?Pictures.flutter: Pictures.dart),
                  //
                  //                       ),
                  //                       Animate(
                  //                           effects: [FadeEffect(duration: 1000.ms),SlideEffect()],
                  //                           child: Text(questions[index].topicName == 'Firebase'?"Firebase":questions[index].topicName == 'Flutter'? "Flutter":"Dart",style: GoogleFonts.nunitoSans(fontSize: w*0.070,fontWeight: FontWeight.w600))),
                  //                     ],
                  //                   )
                  //               ),
                  //             );
                  //           },
                  //       ),
                  //     );
                  //   }
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
                        child: Center(child: Animate(
                            effects: [FadeEffect(duration: 1000.ms),SlideEffect()],
                            child: Text("Sign out",style: GoogleFonts.nunitoSans(fontSize: w*0.070,fontWeight: FontWeight.w600))))),
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
