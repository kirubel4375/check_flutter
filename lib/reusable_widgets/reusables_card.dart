import 'package:flutter/material.dart';
class CardReturn extends StatelessWidget {
  const CardReturn({this.onPressed, this.child});
  final Function onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          color: Colors.black12,
          child: Stack(
            children: [
              child,
              Positioned(
                bottom: 35,
                child: Row(
                  children: [
                    Text('rating  '),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star_outline_outlined),
                    Icon(Icons.star_outline_outlined),
                  ],
                ),
              ),
              Positioned(
                bottom: 11,
                  child: Text('price  ETB 280'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}