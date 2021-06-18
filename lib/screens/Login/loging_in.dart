import 'package:check_flutter/modules/components/already_have_an_account_acheck.dart';
import 'package:check_flutter/modules/customer_services/accounts/signin/log_in.dart';
import 'package:check_flutter/modules/progress_hud_loading_handler.dart';
import 'package:check_flutter/modules/user_handler.dart';
import 'package:check_flutter/reusable_widgets/card_wraper_container.dart';
import 'package:check_flutter/reusable_widgets/path_painter.dart';
import 'package:check_flutter/screens/Signup/signing_up.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import '../error_screen.dart';
import '../home_screen.dart';

class LogingInScreen extends StatelessWidget {
    static final String route= 'log_in_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
              inAsyncCall: Provider.of<ProgressHudHandler>(context).isLoading,
              child: SingleChildScrollView(
                child: ClipRect(
                  child: CustomPaint(
                    painter: MyPainter(),
                    child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
           CardWraperContainer(
             upperText: "Login",
              isSignUp: false,
              userOnChanged: Provider.of<UserHandler>(context, listen: false).setEmail,
              passwordOnChanged: Provider.of<UserHandler>(context, listen: false).setPassword,
              onPressed:  () async{
                      Provider.of<ProgressHudHandler>(context,listen: false).switchLoading();
                      int value=await Provider.of<SignInUser>(context, listen: false).checkForLogIn(context);
                      Provider.of<ProgressHudHandler>(context,listen: false).switchLoading();
                      if(value==-1){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ErrorScreen("no internet connection", route)));
                      }
                      if(value==201)
                      Navigator.pushNamed(context, HomeScreen.route);
                      else{
                        print(value);
                      print('please make sure you are connected to the internet');


                      }
                    },
                    forgotPasswordPress: (){
                      Navigator.pushNamed(context, HomeScreen.route);
                    },
              ),

             Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20,),
            width: MediaQuery.of(context).size.width*0.9,
            child: AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.pushNamed(context, SigningUpScreen.route);
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>SigningUpScreen()));
                },
              ),
             ),

                        ],
                      ),
                    ),
                  ),
                  ),
                ),
        ),
      ),
    );
  }
}



