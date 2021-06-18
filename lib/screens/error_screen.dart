import 'package:check_flutter/modules/customer_services/accounts/signin/log_in.dart';
import 'package:check_flutter/modules/customer_services/accounts/signup/sign_up.dart';
import 'package:check_flutter/modules/progress_hud_loading_handler.dart';
import 'package:check_flutter/modules/user_handler.dart';
import 'package:check_flutter/screens/Login/loging_in.dart';
import 'package:check_flutter/screens/Signup/signing_up.dart';
import 'package:check_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class ErrorScreen extends StatelessWidget {

  const ErrorScreen(this.message, this.screen);
  final String message;
  final String screen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
            inAsyncCall: Provider.of<ProgressHudHandler>(context).isLoading,
             child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  message,
                  textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3.apply(color: Colors.red),
                ),
                SizedBox(height:20),
                ElevatedButton(
                  onPressed: () async {
                    if(screen==LogingInScreen.route){
                      print(Provider.of<UserHandler>(context, listen: false).username);
                      print(Provider.of<UserHandler>(context,listen: false).password);
                      Provider.of<ProgressHudHandler>(context,listen: false).switchLoading();
                      int value=await Provider.of<SignInUser>(context, listen: false).checkForLogIn(context);
                      Provider.of<ProgressHudHandler>(context,listen: false).switchLoading();
                      if(value==201)
                      Navigator.pushNamed(context, HomeScreen.route);
                      else
                      print('please make sure you are connected to the internet');
                    }else if(screen==SigningUpScreen.route){
                      Provider.of<ProgressHudHandler>(context, listen: false).switchLoading();
                          int value=await Provider.of<SingUpUser>(context, listen: false).createUser(context);
                          Provider.of<ProgressHudHandler>(context,  listen: false).switchLoading();
                          if(value==-1){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ErrorScreen('please check your internet connection', SigningUpScreen.route)));
                          }
                          else if(value==201)
                          Navigator.pushNamed(context, HomeScreen.route);

                          else if(value==404)
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ErrorScreen('request not found', SigningUpScreen.route)));
                            else if(value==9){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ErrorScreen('user with name already exists', SigningUpScreen.route)));
                              // Provider.of<Validator>(context, listen: false).nameValidationMessage= "user with name already exists";

                            }
                          print('please make sure you are connected to the internet');
                    }
                      
                    },
                  child: Text('Retry'),
                ),
              ],
          ),),
        ),
      );
  }
}