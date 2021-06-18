import 'package:check_flutter/modules/user_model.dart';
import 'package:check_flutter/screens/Welcome/welcome_customers_screen.dart';
import 'package:check_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:check_flutter/modules/geolocator.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive/hive.dart';


class LoadingScreen extends StatefulWidget {
  static final String route='loading_screen';
  const LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getData();
  }


  void getData()async{
    await location.determinedPosition;
    final _userSignUpModel = Hive.box('storage').get('userSignUpModel') as UserSignUpModel;
    String userId = _userSignUpModel.id;
     SchedulerBinding.instance.addPostFrameCallback((_) {
       if(userId!=null){
      Navigator.pushNamed(context, HomeScreen.route);
    }else if(userId==null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
    }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
  }
}





