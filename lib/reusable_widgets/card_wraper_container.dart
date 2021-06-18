import 'package:check_flutter/modules/components/expanded_button_for_all.dart';
import 'package:check_flutter/modules/components/log_sign_form_field.dart';
import 'package:check_flutter/modules/user_handler.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';





class CardWraperContainer extends StatelessWidget {
  const CardWraperContainer({
    Key key, @required this.upperText, 
    this.onPressed, 
    this.userOnChanged, this.passwordOnChanged, 
    this.confirmOnChanged,
    @required this.isSignUp, 
    this.forgotPasswordPress,
  }) : super(key: key);

  final String upperText;
  final Function onPressed;
  final void Function(String) userOnChanged;
  final void Function(String) passwordOnChanged;
  final bool isSignUp;
  final void Function(String) confirmOnChanged;
  final Function forgotPasswordPress;


  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.75,
      width: MediaQuery.of(context).size.width*0.9,
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text( upperText,
                style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('User name',
                style: TextStyle(
                  fontSize:25 ,
                  fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SignLogForm(
                obscure: false, 
              onchanged: userOnChanged, 
              validator: RequiredValidator(errorText: "This Field Is Required"),
              ),
               Padding(
                padding: const EdgeInsets.only(left:20.0, bottom: 18, top: 20),
                child: Text('Password',
                style: TextStyle(
                  fontSize:25 ,
                  fontWeight: FontWeight.w400,
                  ),
                ),
              ),
               SignLogForm(
                 obscure: true, 
                 onchanged: passwordOnChanged, 
                 validator: MultiValidator([
                   RequiredValidator(errorText: "This Field Is Required"),
                   MinLengthValidator(6, errorText: "Should be atleast 6 characters"),
                 ]),
                 ),
              isSignUp? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                padding: const EdgeInsets.only(left:20.0, bottom: 18, top: 20),
                child: Text('Confirm Password',
                style: TextStyle(
                  fontSize:25 ,
                  fontWeight: FontWeight.w400,
                  ),
                ),
              ),
                  SignLogForm(
                    obscure: true, 
                    onchanged: confirmOnChanged,
                    validator: (value)=> MatchValidator(errorText: "Passwords don't match")
                    .validateMatch(value, Provider.of<UserHandler>(context).password),
                    ),
                ],
              )
              :Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 26.0, bottom: 10.0,),
                    child: TextButton(
                      onPressed: forgotPasswordPress,
                        child: Text('Forgot Password?',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  ],
                  ),
                  SizedBox(height: 30.0,),
                  ExpandedButtonForAll(
                    onPressed: onPressed,
                     text: upperText,
                    
                  ),
            ],),
          ),
        ),

      ),
    );
  }
}