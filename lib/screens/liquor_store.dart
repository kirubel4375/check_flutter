import 'package:flutter/material.dart';


class LiquorScreen extends StatefulWidget {
static final String route='liquor_screen';
  @override
  _LiquorScreenState createState() => _LiquorScreenState();
}

class _LiquorScreenState extends State<LiquorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liquor Stores'),
      ),
      body: ListView.builder(
        itemCount: 30,
          itemBuilder: (context,index){
          return Card(
            child: Text('this is list of the liquor stores',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
          );
          }
      ),
    );
  }
}
