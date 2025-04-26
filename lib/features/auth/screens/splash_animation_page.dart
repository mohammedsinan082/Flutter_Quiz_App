
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/features/auth/screens/splashscreen_page.dart';
import 'package:flutter_quiz_app/core/constants/images.dart';
import 'package:flutter_quiz_app/features/selectionpage/screens/selection_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation, _) {
                return const Second();
              },
              opaque: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
              child: Container(
                height: h*0.2,
                width: w*0.6,
              //  color: Colors.green,
                child: Column(
                  children: [
                    Center(child: Text("Flutter Quiz",style: GoogleFonts.raleway(fontWeight: FontWeight.bold,fontSize: w*0.10,color: Colors.lightBlue.shade500),))
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(builder: (context, constraints) {
        return TweenAnimationBuilder(
            curve: Curves.easeInCirc,
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(seconds: 1),
            child: const SplashScreen(),
            builder: (context, value, child) {
              return ShaderMask(
                blendMode: BlendMode.modulate,
                shaderCallback: (rect) {
                  return RadialGradient(
                      radius: value * 5,
                      colors: const [
                        Colors.white,
                        Colors.white,
                       // Color(0xFFFFFFFFBE),
                        Colors.white,
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.55, 0.6, 1.0],
                      center: const FractionalOffset(1.0, 1.1))
                      .createShader(rect);
                },
                child: child,
              );
            });
      }),
    );
  }
}

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const  Color(0xFFFFFFFFBE),
      body: SafeArea(
        child: Container(
          height: h*0.1,
          width: w*0.2,
          color: Colors.green,
        )
      ),
    );
  }
}
