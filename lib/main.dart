import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/selection_page.dart';
import 'package:flutter_quiz_app/features/auth/screens/signup_page.dart';
import 'package:flutter_quiz_app/survey_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/auth/screens/splashscreen_page.dart';
import 'features/demo.dart';
import 'firebase_options.dart';
var w;
var h;

var currentuseremail;
var currentuserid;
var currentusername;
bool loggedIn=false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;
    return MaterialApp(
     home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

