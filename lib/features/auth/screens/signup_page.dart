import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/core/constants/images.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/auth_controller.dart';
import '../../../main.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {


  void signInWithGoogle(){
    ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      // height: h,
      // width: w,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Pictures.Background1),fit: BoxFit.fill)
      ),

      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
                  Positioned(
                    right: w*0.19,
                    bottom: w*0.50,
                    child: InkWell(
                      onTap: () {
                       signInWithGoogle();
                      },
                      child: Container(
                        height: h*0.05,
                        width: w*0.6,
                       // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Sign up?",style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),),
                            Container(
                              height: h*0.039,
                              width: w*0.25,
                            decoration:BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Pictures.google),fit: BoxFit.cover)
                            ) ,
                            //  color: Colors.blue,
                            )

                          ],
                        ),

                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
