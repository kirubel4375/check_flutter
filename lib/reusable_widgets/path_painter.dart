import 'package:flutter/material.dart';
import '../constants.dart';

   class MyPainter extends CustomPainter{

     Paint painter = Paint()
     ..style= PaintingStyle.fill
     ..color=kWSLcolor;
     
  @override
  void paint(Canvas canvas, Size size) {
    Path path=Path();
      path.lineTo(0.0, size.height/2);
      path.quadraticBezierTo(size.width/2, size.height*0.68, size.width, size.height/2);
      path.lineTo(size.width, 0.0);
      canvas.drawPath(path, painter);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
   }