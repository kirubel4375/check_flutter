import 'package:flutter/material.dart';
import 'cinema_club_card.dart';

class GridCount extends StatefulWidget {
  const GridCount({this.action, this.name, this.onTap, this.scrollDirection, this.crossAxisCount});
  final String action;
  final String name;
  final Function onTap;
  final Axis scrollDirection;
  final int crossAxisCount;

  @override
  _GridCountState createState() => _GridCountState();
}

class _GridCountState extends State<GridCount> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.action,
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          width: MediaQuery.of(context).size.width*2/3,
          child: Divider(thickness: 3,color: Colors.black54,),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: widget.crossAxisCount,
            scrollDirection: widget.scrollDirection,
            children: List.generate(29, (index){
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: CinemaClubCard(
                  name: widget.name,
                  onTap: widget.onTap,),
              );
            }),
          ),
        ),
        Divider(),
      ],
    );
  }
}
