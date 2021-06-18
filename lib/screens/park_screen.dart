import 'package:flutter/material.dart';

class ParkScreen extends StatefulWidget {
  static final String route = 'park_screen';
  const ParkScreen({Key key}) : super(key: key);

  @override
  _ParkScreenState createState() => _ParkScreenState();
}

class _ParkScreenState extends State<ParkScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.red[300],
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          elevation: 0.0,
          title: Text('Parks'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 9,
          itemBuilder: (context,index){
            return Container(
              child: FlutterLogo(size: 180,),
            );
          },
        ),
      ),
    );
  }
}
