
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/images.dart';
import 'package:flutter_quiz_app/models/quiz_model.dart';
import 'package:flutter_quiz_app/selection_page.dart';
import 'package:flutter_quiz_app/utils.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'main.dart';
import 'models/question_model.dart';

class survey_home_page extends StatefulWidget {
  final QuestionModel questionModel;
  const survey_home_page({super.key,required this.questionModel});

  @override
  State<survey_home_page> createState() => _survey_home_pageState();
}

class _survey_home_pageState extends State<survey_home_page> {

  bool isLastQuestion=false;


//  double time=30;



//  double time=0;





  // bool isStart=false;
  // late Timer timer;
  //int seconds=30;

  // void startTimer(){
  //   timer=Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       if(seconds>0){
  //         seconds--;
  //         // if(seconds==0){
  //         //   qnIndex++;
  //         //   seconds=30;
  //         // }
  //       }
  //       else{
  //         seconds=30;
  //         print("++++++++++++++++++++=");
  //         if(seconds == 0) {
  //          qnIndex++;
  //          print("++++++++++++++++++++=+++++++++++++++++++++++++");
  //         }
  //         setState(() {});
  //        // timer.cancel();
  //       }
  //     });
  //   });
  // }



  //
  // void stopTimer(){
  //   setState(() {
  //     timer?.cancel();
  //   });
  // }


  // List<Question> questionList=getQuestions();
 // int currentQuestionIndex = 0;
  // int score = 0;

  String selectedAnswer="";
  List<OptionsModel> questions=[];

  List<Map> options=[
    {
      "Text":"A"
    }, {
      "Text":"B"
    }, {
      "Text":"C"
    }, {
      "Text":"D"
    },
  ];

  String quizId="";

  createExam() async{
     QuizModel quizOptionsModel =QuizModel(
         questions: questions,
         topicId: widget.questionModel.topicId,
         topicName: widget.questionModel.topicName,
       userId: currentuserid,

     );

    DocumentReference ref= FirebaseFirestore.instance.collection('quiz').doc();
     ref.set(quizOptionsModel.toJson());
     quizId=ref.id;




//
//     print("1");
//
//
//     print("2");
//     final snapshot= await FirebaseFirestore.instance.collection('questions').doc(widget.questionModel.topicId).get();
//     print("3");
//     print(snapshot.data());
//     QuestionModel questionModel = QuestionModel.fromJson(snapshot.data()!);
//     print("4");
//     for(var doc in questionModel.questions){
//       OptionsModel optionsModel = OptionsModel.fromJson(doc.toJson());
//       questions.add(optionsModel);
//     }
//
//     print(questions);
//     print("5");
//     print("heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
// //  print(questions[0].toJson());

  }




  @override
  void initState() {
      questions=widget.questionModel.questions;
      createExam();
      print(questions);
      print("**************************");

    if(mounted){
      setState(() {

      });
    }


    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await viewData();
    // });


    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   Future.delayed(Duration(microseconds: 1),() async{
  //     questions.clear();
  //     print("2");
  //     final snapshot= await FirebaseFirestore.instance.collection('questions').doc('EHakYZtvO4ocWqWw2JvL').get();
  //     print("3");
  //     print(snapshot.data());
  //     QuestionModel questionModel = QuestionModel.fromJson(snapshot.data()!);
  //     print("4");
  //     for(var doc in questionModel.questions){
  //       OptionsModel optionsModel = OptionsModel.fromJson(doc.toJson());
  //       if(questionModel.questions.length != questions.length) {
  //         questions.add(optionsModel);
  //       }
  //     }
  //
  //     if(mounted){
  //       setState(() {
  //
  //       });
  //     }
  //     print(questions);
  //     print("**************************");
  //   });
  //   super.didChangeDependencies();
  // }

  final CountdownController _controller =
  new CountdownController(autoStart: true);


  int qnIndex=0;
  @override
  Widget build(BuildContext context) {


    print(questions.length);
    print("OOOOOOOOOOOOOOOOOOOOOOOOO");

    if(questions.isEmpty){
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
     // color: Color(0xFFF5F5F5),
      color: Colors.grey.shade200,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage(Pictures.Background),fit: BoxFit.fill),
      //     // gradient: LinearGradient(
      //     //     begin: Alignment.bottomRight,
      //     //     end: Alignment.topRight,
      //     //     colors: <Color>[Colors.black12, Colors.green])
      // ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade200,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Flutter Quiz",
              style: TextStyle(
                  color: Colors.blue[900], fontSize: 35, fontWeight: FontWeight.bold),
            ),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
                child: Icon(Icons.arrow_back,color: Colors.black)),
          ),
          backgroundColor: Colors.transparent,
          // appBar: PreferredSize(
          //   leading: Icon(Icons.arrow_back,size: w*0.1,color: Colors.white,),
          //   preferredSize: Size.fromHeight(80.0),
          //   child: Container(
          //     height: h * 0.09,
          //     width: w * 0.1,
          //      color: Colors.transparent,
          //   ),
          // ),
          body:
             Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _questionNumber(details: questions,question:questions[qnIndex].question),
                // _questionText(question:questions[qnIndex].question),
                _answerList( dat: questions[qnIndex]),
                _nextButton(details: questions)
              ],
               // Center(
               //   child: ElevatedButton(onPressed: () async {
               //     try{
               //       print("%%%%%%%%%%%%%%%%%%%");
               //       await FirebaseFirestore.instance.collection('questions').doc("test1").set(
               //           {"hai":"aaaaaaaaaaaaaaaaaaaaaaaaa"}).onError((error, stackTrace) {
               //             print(error);
               //             print("TTTTTTTTTTTTTTTTTTTTTTTT");
               //       });
               //       print("#################");
               //     }
               //     on SocketException catch(ef){
               //       print(ef);
               //       print("^^^^^^^^^^^^^^^^^^^^^");
               //     }
               //     on FirebaseException catch(em){
               //       print(em);
               //       print('&&&&&&&&&&&&&&&&&&&&&&');
               //     }
               //     catch (e){
               //       print(e);
               //       print("+++++++++++++++++++++++++");
               //     }
               //
               //   }, child: Text("data")),
               // )
               // StreamBuilder<QuestionModel>(
               //   stream: FirebaseFirestore.instance.collection('questions').doc("EHakYZtvO4ocWqWw2JvL")
               //       .snapshots().map((event) =>QuestionModel.fromJson(event.data() as Map<String,dynamic>) ),
               //   builder: (context,snapshot) {
               //     print(snapshot.error);
               //     print(snapshot.error);
               //     print(snapshot.error);
               //     print(snapshot.error);
               //     print(snapshot.error);
               //     // if (!snapshot.hasData) {
               //     //   return Center(
               //     //     child: CircularProgressIndicator(),
               //     //   );
               //     // }else if(snapshot.hasError){
               //     //   return Center(
               //     //     child: CircularProgressIndicator(),
               //     //   );
               //     //   print("error");
               //     // }
               //     QuestionModel details=snapshot.data!;
               //     List<OptionsModel>qn=[];
               //     for(var i in details.questions){
               //       qn.add(i);
               //     }
               //     return ListView.builder(
               //       itemCount: qn.length,
               //       itemBuilder: (BuildContext context, int index) {
               //
               //
               //         // var detailslength=details.length;
               //
               //         OptionsModel Questionindex = qn[index];
               //         List<String>answers=[];
               //         return  Column(
               //           mainAxisAlignment: MainAxisAlignment.spaceAround,
               //           children: [
               //             _questionNumber(Questionindex: Questionindex, details: qn),
               //             _questionText(question:qn[index].question),
               //             _answerList( dat: qn[index] ),
               //             _nextButton()
               //           ],
               //         );
               //       },
               //
               //     );
               //   },
               // ),
            ),
          ),
      )
    );
        // Center(
        //   child: ElevatedButton(onPressed: () async {
        //     try{
        //       print("%%%%%%%%%%%%%%%%%%%");
        //       await FirebaseFirestore.instance.collection('questions').doc("test1").set(
        //           {"hai":"aaaaaaaaaaaaaaaaaaaaaaaaa"}).onError((error, stackTrace) {
        //             print(error);
        //             print("TTTTTTTTTTTTTTTTTTTTTTTT");
        //       });
        //       print("#################");
        //     }
        //     on SocketException catch(ef){
        //       print(ef);
        //       print("^^^^^^^^^^^^^^^^^^^^^");
        //     }
        //     on FirebaseException catch(em){
        //       print(em);
        //       print('&&&&&&&&&&&&&&&&&&&&&&');
        //     }
        //     catch (e){
        //       print(e);
        //       print("+++++++++++++++++++++++++");
        //     }
        //
        //   }, child: Text("data")),
        // )
        // StreamBuilder<QuestionModel>(
        //   stream: FirebaseFirestore.instance.collection('questions').doc("EHakYZtvO4ocWqWw2JvL")
        //       .snapshots().map((event) =>QuestionModel.fromJson(event.data() as Map<String,dynamic>) ),
        //   builder: (context,snapshot) {
        //     print(snapshot.error);
        //     print(snapshot.error);
        //     print(snapshot.error);
        //     print(snapshot.error);
        //     print(snapshot.error);
        //     // if (!snapshot.hasData) {
        //     //   return Center(
        //     //     child: CircularProgressIndicator(),
        //     //   );
        //     // }else if(snapshot.hasError){
        //     //   return Center(
        //     //     child: CircularProgressIndicator(),
        //     //   );
        //     //   print("error");
        //     // }
        //     QuestionModel details=snapshot.data!;
        //     List<OptionsModel>qn=[];
        //     for(var i in details.questions){
        //       qn.add(i);
        //     }
        //     return ListView.builder(
        //       itemCount: qn.length,
        //       itemBuilder: (BuildContext context, int index) {
        //
        //
        //         // var detailslength=details.length;
        //
        //         OptionsModel Questionindex = qn[index];
        //         List<String>answers=[];
        //         return  Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: [
        //             _questionNumber(Questionindex: Questionindex, details: qn),
        //             _questionText(question:qn[index].question),
        //             _answerList( dat: qn[index] ),
        //             _nextButton()
        //           ],
        //         );
        //       },
        //
        //     );
        //   },
        // ),
  }

  _questionNumber({required details,required String question}) {
    return Column(
      children: [
        // Text(
        //   "Flutter Quiz",
        //   style: TextStyle(
        //       color: Colors.lightBlue.shade200, fontSize: 35, fontWeight: FontWeight.bold),
        // ),
        SizedBox(
          height: w * 0.02,
        ),
        Container(
          height: h*0.31,
          width: w*0.89,
      //    color: Colors.blueGrey,
          child:  Stack(

            children: [
              Positioned(
                top: 45,
                left: 10,
                child: Container(
                  height: h*0.23,
                  width: w*0.84,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow:
                      [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                          spreadRadius: 10,
                          blurRadius: 7,
                          offset: Offset(0,3)
                      ),],
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Container(
                    alignment: Alignment.center,
                    //height: h * 0.07,
                    width: w * 0.7,
                    decoration: BoxDecoration(
                      //  color: Colors.black38,
                        // gradient: LinearGradient(colors:<Color>[
                        //   Colors.red,
                        //   Colors.black
                        // ]),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      question,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                  ),



                      // Container(
                      //   width: w*0.15,
                      //   height: w*0.15,
                      //   child: Stack(
                      //     children: [
                      //       CircularProgressIndicator(
                      //         value: 30/60,
                      //         strokeWidth: 8,
                      //         backgroundColor: Colors.red.withOpacity(0.2),
                      //         color: Colors.red,
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      // Container(
                      //   height: h * 0.15,
                      //   width: w * 0.15,
                      //   decoration: BoxDecoration(
                      //       color: Colors.green,
                      //    // borderRadius: BorderRadius.circular(100),
                      //     shape: BoxShape.circle,
                      //   ),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Text(
                      //         "${qnIndex + 1}",
                      //         style: TextStyle(
                      //         fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
                      //       ),
                      //       Text("____"),
                      //       Text(
                      //         "${details.length.toString()}",
                      //         style: TextStyle(
                      //         fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 140,
                bottom:189,
                child: SizedBox(
                  width: w*0.16,
                  height: w*0.16,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: 30/60,
                        strokeWidth: 8,
                        backgroundColor: Colors.blue.withOpacity(0.2),
                        color: Colors.blue[900],
                      ),
                      Positioned(
                        bottom: 7,
                        left:8 ,
                        top: 7,
                         child: Container(
                           height: h*0.040,
                         //  color: Colors.red,
                           width: w*0.12,
                           child: Center(
                             child: Countdown(
                               controller: _controller,
                               seconds: 30,
                               build: (BuildContext context, double time) => Text(time.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),),
                               interval: Duration(milliseconds: 100),
                               onFinished: () {
                              //   bool isLastQuestion=false;

                                 // qnIndex++;
                                 // _controller.restart();


                               if (qnIndex == questions.length - 1) {

                                  isLastQuestion = true;
                                  _controller.pause();
                                }   if(isLastQuestion==true) {
                                 print("submitted");
                                 print(
                                     "55555555555555555555555555555555555555555555555");
                                 FirebaseFirestore.instance.collection("quiz")
                                     .doc(quizId)
                                     .update({
                                   "questions": List.generate(
                                       questions.length, (index) =>
                                       questions[index].toJson())
                                 });
                                 showDialog(context: context,
                                     barrierDismissible: false,
                                     builder: (_) =>
                                         _showScore(details: details));
                               } else {
                                  print(
                                      "88888888888888888888888888888888888888888888");
                                  qnIndex++;
                                  print(qnIndex);
                                  print("qnIndex");
                                  _controller.restart();
                                  setState(() {

                                  });
                                }
                                print('Timer is done!');




                               },
                             ),
                           ),
                         ),
                        // child: isStart?InkWell(
                        //   onTap: () {
                        //     setState(() {
                        //       isStart=!isStart;
                        //     });
                        //     startTimer();
                        //   },
                        //   child: Container(
                        //     height: h*0.040,
                        //     width: w*0.12,
                        //     // color: Colors.blue,
                        //     //   padding: EdgeInsets.only(top: 15,bottom: 15),
                        //     child: Center(child: Text("0",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                        //   ),
                        // ):
                        // InkWell(
                        //   onTap: () {
                        //     setState(() {
                        //       isStart=!isStart;
                        //     });
                        //     stopTimer();
                        //   },
                        //   child: Container(
                        //     height: h*0.040,
                        //     width: w*0.12,
                        //     // color: Colors.blue,
                        //     //   padding: EdgeInsets.only(top: 15,bottom: 15),
                        //     child: Center(child: Text(seconds.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                        //   ),
                        // ),
                      ),

                    ],
                  ),
                ),
              ),
              Positioned(
                top: 215,
                left: 292,
                child: Container(

               //   color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${qnIndex + 1}/${details.length.toString()}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500, color: Colors.blue.shade900),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )

      ],
    );
  }

  // _questionText({required String question}) {
  //   return Container(
  //     alignment: Alignment.center,
  //     height: h * 0.07,
  //     width: w * 0.9,
  //     decoration: BoxDecoration(
  //         color: Colors.black38,
  //         // gradient: LinearGradient(colors:<Color>[
  //         //   Colors.red,
  //         //   Colors.black
  //         // ]),
  //         borderRadius: BorderRadius.circular(15)),
  //     child: Text(
  //       question,
  //       style: TextStyle(
  //           fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
  //     ),
  //   );
  // }

  _answerList({required OptionsModel dat}) {
    return Column(
      children: [
        _answerButton(dat.option_A,options[0]['Text'],dat.answer),
        _answerButton(dat.option_B,options[1]['Text'],dat.answer),
        _answerButton(dat.option_C,options[2]['Text'],dat.answer),
        _answerButton(dat.option_D,options[3]['Text'],dat.answer),
      ],
        // children: List.generate(4,
        //     (index) => _answerButton(, index))
    );
  }

  Widget _answerButton(String dat,String option,String answer) {
    // String options = index == 0
    //     ? question.option_A
    //     : index == 1
    //         ? question.option_B
    //         : index == 2
    //             ? question.option_C
    //             : question.option_D;
    String options=dat;
    bool selectedanswer= options==selectedAnswer;
    bool isnotcorrectanswer=!selectedanswer;
    return InkWell(
      onTap: () {
        selectedAnswer=options;
        questions[qnIndex].submitted=dat;

              // questions[currentQuestionIndex].submitted=index == 0?"a":index == 1?"b":index == 2?"c":"d";
               //print(List.generate(questions.length, (index) => questions[index].submitted));
            setState(() {
            });
            print(selectedAnswer);
            print(answer);
            print(option);
            print("))))))))))))))))))))))))))))");

      },

      child: Center(
        child: Container(
          width: w*0.85,
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.only(right: 3, left: 3,top: 3,bottom: 3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          //  border: Border.all(width: 2,color: selectedanswer? Colors.green:Colors.black,),
          ),

          child: Row(
            children: [
              Container(
                  height: h*0.05,
                  width: w*0.11,
                  decoration: BoxDecoration(
                      color: selectedanswer?Colors.green:Colors.blue[900],
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Center(child: Text(option, style: TextStyle(fontSize: 20,color:Colors.white),))),
              SizedBox(width: w*0.03,),
              SizedBox(
                 // width: w*0.7,
                child: Text(options,style: TextStyle(fontSize:18,color: ((selectedAnswer == answer && answer == options) || (selectedAnswer != answer && answer == options && selectedAnswer == '')) ?
                Colors.green : (selectedAnswer != answer && answer != options)
                    ? Colors.red : selectedAnswer == '' ? Colors.black : Colors.blue),),
                 //  child: Text(options, style: TextStyle(fontSize: 18,color:selectedAnswer == answer ? Colors.green : selectedAnswer != answer && selectedAnswer != '' ? Colors.red :Colors.black),)
              ),
            ],
          ),


          // child: ElevatedButton(
          //   child: Text(
          //     options,
          //     style: TextStyle(fontSize: 20),
          //   ),
          //   style: ElevatedButton.styleFrom(
          //
          //     shape: StadiumBorder(),
          //     primary: selectedanswer ? Colors.green:Colors.white70,
          //     onPrimary:selectedanswer? Colors.white: Colors.black
          //   ),
          //   onPressed: () {
          //       selectedAnswer=options;
          //
          //       // questions[currentQuestionIndex].submitted=index == 0?"a":index == 1?"b":index == 2?"c":"d";
          //       // print(List.generate(questions.length, (index) => questions[index].submitted));
          //     setState(() {
          //     });
          //   },
          // ),
        ),
      ),
    );
  }

_nextButton({required details}){
  bool isLastQuestion=false;
  if(qnIndex==questions.length-1){
    isLastQuestion=true;
  }
  return InkWell(
    onTap: () {
      if(qnIndex < questions.length-1){
        //  if(selectedanswer==true){
        //   qnIndex++;
        if(selectedAnswer==""){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Select any option")));
        }else{
          if(isLastQuestion==true){

            print("submitted");
            print("55555555555555555555555555555555555555555555555");
            FirebaseFirestore.instance.collection("quiz").doc(quizId).update({
              "questions":List.generate(questions.length, (index) => questions[index].toJson())
            });
            showDialog(context: context,barrierDismissible: false, builder: (_) => _showScore(details: details));
          }else{
            try{
              print('else part');
              // OptionsModel model=OptionsModel(
              //   question: questions[qnIndex].question,
              //   option_A: questions[qnIndex].option_A,
              //   option_B: questions[qnIndex].option_B,
              //   option_C: questions[qnIndex].option_C,
              //   option_D: questions[qnIndex].option_D,
              //   answer: selectedAnswer,
              //   submitted: "",
              // );
              // // print(model.question);
              // print(model.submitted);
              // print("ffffffffffffffffffffffffffffffffffffff");
              // print(model.submitted);
              // FirebaseFirestore.instance.collection("Score").add(model.toJson());

              print('working');


              selectedAnswer="";
              qnIndex++;
              _controller.restart();
              // startTimer();
              // seconds=0;
              setState(() {
              });
            } on FirebaseException catch(e){
              throw e.message!;
            }catch(e){
              print(e.toString());
            }


          }

        }
        if(isLastQuestion==true){
          showDialog(context: context,barrierDismissible: false, builder: (_) => _showScore(details: details));
        }else{


        }
        // }


      }else{
        if(selectedAnswer==""){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Select any option")));
        }else{
          FirebaseFirestore.instance.collection("quiz").doc(quizId).update({
            "questions":List.generate(questions.length, (index) => questions[index].toJson())
          });
          showDialog(context: context,barrierDismissible: false, builder: (_) => _showScore(details: details));
          qnIndex=0;
        }


        // showSnackBar(context, "Noooo");

      }
      print(qnIndex);
      print(questions.length);
      print("**********************8");
      setState(() {

      });
      // if(selectedAnswer==""){
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Select any option")));
      // }else{
      //   if(isLastQuestion){
      //
      //     print("submitted");
      //     showDialog(context: context, builder: (_) => _showScore());
      //   }else{
      //     try{
      //       print('else part');
      //       OptionsModel model=OptionsModel(
      //           question: questions[currentQuestionIndex].question,
      //           option_A: questions[currentQuestionIndex].option_A,
      //           option_B: questions[currentQuestionIndex].option_B,
      //           option_C: questions[currentQuestionIndex].option_C,
      //           option_D: questions[currentQuestionIndex].option_D,
      //           answer: selectedAnswer,
      //         submitted: "",
      //       );
      //      // print(model.question);
      //       print(model.submitted);
      //       print("ffffffffffffffffffffffffffffffffffffff");
      //       print(model.submitted);
      //       FirebaseFirestore.instance.collection("Score").add(model.toJson());
      //
      //       print('working');
      //
      //
      //       selectedAnswer="";
      //       currentQuestionIndex++;
      //       setState(() {
      //
      //       });
      //     } on FirebaseException catch(e){
      //       throw e.message!;
      //     }catch(e){
      //       print(e.toString());
      //     }
      //
      //
      //   }
      //
      // }
      // if(isLastQuestion==true){
      //    showDialog(context: context, builder: (_) => _showScore());
      // }else{
      //
      //
      // }
    },
    child: Container(
      width: w*0.8,
      //color: Colors.red,
      decoration: BoxDecoration(
        color: Colors.blue[900],
       // border: Border.all(color: Colors.lightBlue.shade200,width: 1.5),
        borderRadius: BorderRadius.circular(7)
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      height: h*0.05,
      child: Center(child: Text(isLastQuestion==true? "Submit":"Next",style: TextStyle(fontSize: w*0.077,color: Colors.white,),)
      ),
      // ElevatedButton(
      //   child: Text(isLastQuestion? "Submit":"Next"),
      //   style:
      //   ElevatedButton.styleFrom(
      //       shape: StadiumBorder(),
      //       primary: Colors.blue,
      //       onPrimary:Colors.white
      //   ),
      //   onPressed: () {
      //     if(qnIndex < questions.length-1){
      //     //  if(selectedanswer==true){
      //      //   qnIndex++;
      //         if(selectedAnswer==""){
      //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Select any option")));
      //         }else{
      //           if(isLastQuestion){
      //
      //             print("submitted");
      //             showDialog(context: context, builder: (_) => _showScore());
      //           }else{
      //             try{
      //               print('else part');
      //               OptionsModel model=OptionsModel(
      //                 question: questions[qnIndex].question,
      //                 option_A: questions[qnIndex].option_A,
      //                 option_B: questions[qnIndex].option_B,
      //                 option_C: questions[qnIndex].option_C,
      //                 option_D: questions[qnIndex].option_D,
      //                 answer: selectedAnswer,
      //                 submitted: "",
      //               );
      //               // print(model.question);
      //               print(model.submitted);
      //               print("ffffffffffffffffffffffffffffffffffffff");
      //               print(model.submitted);
      //               FirebaseFirestore.instance.collection("Score").add(model.toJson());
      //
      //               print('working');
      //
      //
      //               selectedAnswer="";
      //               qnIndex++;
      //               setState(() {
      //
      //               });
      //             } on FirebaseException catch(e){
      //               throw e.message!;
      //             }catch(e){
      //               print(e.toString());
      //             }
      //
      //
      //           }
      //
      //         }
      //         if(isLastQuestion==true){
      //           showDialog(context: context, builder: (_) => _showScore());
      //         }else{
      //
      //
      //         }
      //      // }
      //
      //
      //     }else{
      //      qnIndex=0;
      //       showSnackBar(context, "Noooo");
      //
      //     }
      //     print(qnIndex);
      //     print(questions.length);
      //     print("**********************8");
      //     setState(() {
      //
      //     });
      //     // if(selectedAnswer==""){
      //     //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Select any option")));
      //     // }else{
      //     //   if(isLastQuestion){
      //     //
      //     //     print("submitted");
      //     //     showDialog(context: context, builder: (_) => _showScore());
      //     //   }else{
      //     //     try{
      //     //       print('else part');
      //     //       OptionsModel model=OptionsModel(
      //     //           question: questions[currentQuestionIndex].question,
      //     //           option_A: questions[currentQuestionIndex].option_A,
      //     //           option_B: questions[currentQuestionIndex].option_B,
      //     //           option_C: questions[currentQuestionIndex].option_C,
      //     //           option_D: questions[currentQuestionIndex].option_D,
      //     //           answer: selectedAnswer,
      //     //         submitted: "",
      //     //       );
      //     //      // print(model.question);
      //     //       print(model.submitted);
      //     //       print("ffffffffffffffffffffffffffffffffffffff");
      //     //       print(model.submitted);
      //     //       FirebaseFirestore.instance.collection("Score").add(model.toJson());
      //     //
      //     //       print('working');
      //     //
      //     //
      //     //       selectedAnswer="";
      //     //       currentQuestionIndex++;
      //     //       setState(() {
      //     //
      //     //       });
      //     //     } on FirebaseException catch(e){
      //     //       throw e.message!;
      //     //     }catch(e){
      //     //       print(e.toString());
      //     //     }
      //     //
      //     //
      //     //   }
      //     //
      //     // }
      //     // if(isLastQuestion==true){
      //     //    showDialog(context: context, builder: (_) => _showScore());
      //     // }else{
      //     //
      //     //
      //     // }
      //   },
      // ),
    ),
  );
}

String _getGrade(int marks){
    return marks>=questions.length *0.9?"Excellent":marks>=questions.length *0.8?"Impressive":marks>=questions.length *0.7?"Fantastic":marks>=questions.length *0.6?"Superb":"Failed";
}

_showScore({required details}){

  bool ispassed=false;

  int marks=0;
  // String grade='';

  // List data=[
  //   marks >= questions.length *1,
  //   marks >= questions.length *0.8,
  //   marks >= questions.length *0.7,
  //   marks >= questions.length *0.6,
  //
  // ]

  for(var a in questions){
    if(a.submitted==a.answer){
      marks++;
    }
  }
  print(marks);


  // switch (data) {
  //   case marks >= questions.length *0.9||0.10:
  //     grade = 'Excellent';
  //     break;
  //   case marks >= questions.length *0.8:
  //     grade = 'Impressive';
  //     break;
  //   case marks >= questions.length *0.7:
  //     grade = 'Fantastic';
  //     break;
  //   case marks >= questions.length *0.6:
  //     grade = 'Superb';
  //     break;
  //   default:
  //     grade = 'Fail';
  // }

  if(marks >= questions.length *0.6){
    ispassed=true;
  }
  var percentage=(marks/details.length)*100;
  print(percentage);



  // String title=ispassed? "passed":"Failed !!";


  return AlertDialog(

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
    ),
    backgroundColor: Colors.blueGrey.shade200,

  //  title: Center(child: Text(_getGrade(marks) ,style: TextStyle(color: ispassed? Colors.green:Colors.red,fontSize: 35))),

    content: Container(
      height: marks >= questions.length *0.6?h*0.55:h*0.50,
      width: w*0.81,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          marks >= questions.length *0.6?
          Image.asset(Pictures.fail):
          Image.asset(Pictures.pass),
          Center(child: Text(_getGrade(marks) ,style: TextStyle(color: ispassed? Colors.green:Colors.red,fontSize: 35,fontWeight: FontWeight.w600))),
             Text("${percentage.toInt()}% Score",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green.shade600)),
             Text("Quiz Completed Succesfully",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.green.shade700)),
          SizedBox(
              width: w*0.7,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("you attempted ", style: TextStyle(fontSize: 17,color:Colors.black),),
                      Text("${details.length.toString()} Questions",style: TextStyle(color: Colors.blue.shade900,fontSize: 17,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Row(
                    children: [
                      Text("from that ", style: TextStyle(fontSize: 17,color:Colors.black),),
                      Text("${marks} Questions",style: TextStyle(color: Colors.green.shade700,fontSize: 17,fontWeight: FontWeight.bold),),
                      Text(" is correct ", style: TextStyle(fontSize: 17,color:Colors.black),),
                    ],
                  ),
                ],
              )),

          //   Text("Score:${marks}/${details.length.toString()}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500)),
             // Image.asset(Pictures.pass),

          ElevatedButton(

            child: Text("Home"),
            onPressed: () {
              print(percentage);
              print("percentage");
              print( "99999999999999999999999999999999999999999999");
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SelectionPage(),), (route) => false);
              // setState(() {
              //
              // });
              // selectedAnswer="";
              // qnIndex=0;
              // marks=0;
              // for(var a in questions){
              //   a.copyWith(submitted: "");
              // }

            },
          ),
        ],
      ),
    ),

  );
}

  //
  // void convertMarksToGrade(int marks,String title) {
  //   setState(() {
  //     switch (marks) {
  //       case marks >= questions.length *0.9||0.10:
  //         title = 'Excellent';
  //         break;
  //       case marks >= questions.length *0.8:
  //         title = 'Impressive';
  //         break;
  //       case marks >= questions.length *0.7:
  //         title = 'Fantastic';
  //         break;
  //       case marks >= questions.length *0.6:
  //         title = 'Superb';
  //         break;
  //       default:
  //         title = 'Fail';
  //     }
  //   });
  // }

counter(){
  Countdown(
    seconds: 20,
    build: (BuildContext context, double time) => Text(time.toString()),
    interval: Duration(milliseconds: 100),
    onFinished: () {
      print('Timer is done!');
    },
  );
}




}


