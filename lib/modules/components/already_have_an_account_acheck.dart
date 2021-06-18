import 'package:flutter/material.dart';
import 'package:check_flutter/constants.dart';
class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            ),
        ),
        TextButton(
          onPressed: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: kWSLcolor,
              fontWeight: FontWeight.w600,
              fontSize: 23,
            ),
          ),
        )
      ],
    );
  }
}
