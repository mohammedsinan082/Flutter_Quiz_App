import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/features/auth/screens/signup_page.dart';
import 'package:flutter_quiz_app/core/constants/images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/sharedpreferconstants.dart';
import '../../../main.dart';
import '../../selectionpage/screens/selection_page.dart';

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
    return SafeArea(
      child: Scaffold(
      //  backgroundColor: Colors.white,
        body: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Pictures.zzzz),fit: BoxFit.fill),
            // gradient: LinearGradient(
            //     begin: Alignment.bottomRight,
            //     end: Alignment.topRight,
            //     colors: <Color>[Colors.black12, Colors.green])
          ),
          child:   Center(
            child: Container(
              height: h*0.2,
              width: w*0.6,
              //  color: Colors.green,
              child: Column(
                children: [
                  Center(child: Text("Flutter Quiz",style: GoogleFonts.raleway(fontWeight: FontWeight.bold,fontSize: w*0.10,color: Colors.white),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



