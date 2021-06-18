import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DemoScreen extends StatefulWidget {
  const DemoScreen({Key key}) : super(key: key);

  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  String api='http://188.166.153.99:8500/';
  String superIdToken='08dc215c1d3771081deaa22fa51ab5d20e3ddfe8';

  void getData()async{
    var url =Uri.parse(api+'/accounts/signup/');
    await http.post(url, body: {
      "Authorization": "Token 08dc215c1d3771081deaa22fa51ab5d20e3ddfe8",
      "Content-Type": "application/json",
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
