import 'package:check_flutter/reusable_widgets/custom_dialog_box.dart';
import 'package:check_flutter/reusable_widgets/grid_count.dart';
import 'package:flutter/material.dart';
class CinemaScreen extends StatefulWidget {
  static final String route='cinema_screen';

  @override
  _CinemaScreenState createState() => _CinemaScreenState();
}

class _CinemaScreenState extends State<CinemaScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            Expanded(
              child: GridCount(
                crossAxisCount: MediaQuery.of(context).orientation.index==0?2:1,
                action: 'Cinemas',
                name: 'cinema',
                onTap: ()async{
                  await showDialog(context: context, builder:(context)=>CustomDialogBox());
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            Expanded(
              child: GridCount(
                crossAxisCount: MediaQuery.of(context).orientation.index==0?2:1,
                action: 'Clubs',
                name: 'club',
                onTap: ()async{
                  await showDialog(context: context, builder:(context)=>CustomDialogBox());
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



