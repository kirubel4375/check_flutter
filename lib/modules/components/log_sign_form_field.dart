import 'package:check_flutter/constants.dart';
import 'package:flutter/material.dart';

class SignLogForm extends StatelessWidget {
  const SignLogForm({

    Key key, @required this.obscure, @required this.onchanged, @required this.validator,
  }) : super(key: key);
  final bool obscure;
  final void Function(String) onchanged;
  final String Function(String) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscuringCharacter: '*',
      style: TextStyle(
        color: kWSLcolor,
        fontSize: 20,
      ),
      textAlign: TextAlign.center,
     decoration: InputDecoration(
       errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
         borderSide: BorderSide(
           color: Colors.red,
         ),),
         focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
           borderSide: BorderSide(
             color: Colors.teal,
         ),),
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(40),
       ),
     ),
     onChanged: onchanged,
     );
  }
}



// obscure? Provider.of<Validator>(context).passwordValidator 
//       : Provider.of<Validator>(context).usernameValidator,

// MultiValidator([
//         RequiredValidator(errorText: "This field is required!"),
//         MinLengthValidator(6, errorText: "Enter atleast 6 characters")
//       ])
//       : MultiValidator([

//       ]),
