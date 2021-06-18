import 'package:check_flutter/modules/components/expanded_button_for_all.dart';
import 'package:check_flutter/reusable_widgets/path_painter.dart';
import 'package:check_flutter/screens/Login/loging_in.dart';
import 'package:check_flutter/screens/Signup/signing_up.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';


class WelcomeScreen extends StatelessWidget {
   static final String route= 'log_in_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ClipRect(
          child: CustomPaint(
            painter: MyPainter(),
            child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Container(
      height: MediaQuery.of(context).size.height*0.6,
      width: MediaQuery.of(context).size.width*0.9,
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("WelcomeTo our custome service",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3.copyWith(
                  color: kWSLcolor,
                  fontWeight: FontWeight.w600,
                ),
                ),
                ExpandedButtonForAll(
                  text: "Login",
                  onPressed: (){
                      Navigator.pushNamed(context, LogingInScreen.route);
                  },
                  ),
                ExpandedButtonForAll(
                  text: "Sign Up",
                   onPressed: (){
                       Navigator.pushNamed(context, SigningUpScreen.route);
                   },
                  ),
              ],
            ),
          ),
        ),
                    ),
            ),
                      ),
                      ),
                  )
                  
                );
              }
            }


          
          