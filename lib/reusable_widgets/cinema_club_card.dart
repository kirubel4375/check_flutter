import 'package:flutter/material.dart';

class CinemaClubCard extends StatelessWidget {
  const CinemaClubCard({@required this.name, this.onTap});

  final String name;
  final Function onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black12,
        ),
        child: Stack(
          children: [
            FlutterLogo(size: 100,),
            Positioned(
                bottom: 12,
                child: Text(name),
            ),
          ],
        ),
      ),
    );
  }
}

// Card(
// color: Colors.black12,
// child: Stack(
// children: [
// Text('cinema'),
// ],
// ),
// )
