import 'package:check_flutter/modules/components/already_have_an_account_acheck.dart';
import 'package:check_flutter/modules/customer_services/accounts/signup/sign_up.dart';
import 'package:check_flutter/modules/progress_hud_loading_handler.dart';
import 'package:check_flutter/modules/user_handler.dart';
import 'package:check_flutter/reusable_widgets/card_wraper_container.dart';
import 'package:check_flutter/reusable_widgets/path_painter.dart';
import 'package:check_flutter/screens/Login/loging_in.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import '../error_screen.dart';
import '../home_screen.dart';

class SigningUpScreen extends StatelessWidget {
  static final String route= 'sign_up_screen';

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
             upperText: "Sign Up",
              isSignUp: true,
              userOnChanged: Provider.of<UserHandler>(context, listen: false).setEmail,
              passwordOnChanged: Provider.of<UserHandler>(context, listen: false).setPassword,
              onPressed: ()async{
                 Provider.of<ProgressHudHandler>(context, listen: false).switchLoading();
                        int value=await Provider.of<SingUpUser>(context, listen: false).createUser(context);
                        Provider.of<ProgressHudHandler>(context,  listen: false).switchLoading();
                        if(value==-1){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ErrorScreen('please check your internet connection', route)));
                        }
                        else if(value==201)
                        Navigator.pushNamed(context, HomeScreen.route);

                        else if(value==404)
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ErrorScreen('request not found', route)));
                          else if(value==9){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ErrorScreen('user with name already exists', route)));
                            // Provider.of<Validator>(context, listen: false).nameValidationMessage= "user with name already exists";

                          }
                        print('$value please make sure you are connected to the internet');
                      },
                      confirmOnChanged: Provider.of<UserHandler>(context, listen: false).setConfirmPassword,
              ),

               Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20,),
              width: MediaQuery.of(context).size.width*0.9,
              child: AlreadyHaveAnAccountCheck(
              login: false,
                  press: () {
                    Navigator.pushNamed(context, LogingInScreen.route);
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>LogingInScreen()));
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