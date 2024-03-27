import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/features/auth/screens/signup_page.dart';
import 'package:flutter_quiz_app/images.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/sharedpreferconstants.dart';
import '../../../main.dart';
import '../../../selection_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  loggedInCheck() async {
    SharedPreferences prefs= await SharedPreferences.getInstance();

    loggedIn=prefs.getBool("login")??false;
    currentusername =prefs.getString(SharedPreferConstants.userName)??"no name given";
    currentuseremail =prefs.getString(SharedPreferConstants.userEmail)??"no email given";
    currentuserid = prefs.getString(SharedPreferConstants.userId)??"no id given";

    Future.delayed(Duration(seconds: 2)).then((value) => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loggedIn==false? SignupPage():SelectionPage(),))
    });


  }
  @override
  void initState() {
    loggedInCheck();
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: h*0.3,
                width: w*0.6,
              //  color: Colors.red,
                child: Image.asset(Pictures.flutter,),
              ),
            ],
          )
        ],
      ),
    );
  }
}
