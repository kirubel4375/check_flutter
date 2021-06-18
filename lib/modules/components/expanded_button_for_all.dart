import 'package:check_flutter/constants.dart';
import 'package:flutter/material.dart';



class ExpandedButtonForAll extends StatelessWidget {
  const ExpandedButtonForAll({
    Key key, this.onPressed, @required this.text,
  }) : super(key: key);
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
                  
     child: Container(
         height: 64.0,
         width: double.infinity,
         decoration: BoxDecoration(
           color: kWSLcolor,
           borderRadius: BorderRadius.circular(40),
           ),
           child: Center(
             child: Text(text,
             style: TextStyle(
               color: Colors.white,
               fontSize: 25,
               fontWeight: FontWeight.bold,
             ),
             ),
           ),
       ),
    );
  }
}
