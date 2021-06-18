import 'package:flutter/material.dart';

class UpperButton extends StatelessWidget {
  const UpperButton({@required this.buttonName,this.rightSizeMargin, @required this.onPressed});
  final String buttonName;
  final double rightSizeMargin;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right:rightSizeMargin),
        child: OutlinedButton(
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: TextStyle(
              color: Colors.lightBlueAccent,
            ),
          ),
        ),
      ),
    );
  }
}

class Iconbutton extends StatelessWidget {
  const Iconbutton({this.icon,this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}