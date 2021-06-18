import 'package:check_flutter/screens/Login/loging_in.dart';
import 'package:check_flutter/screens/Signup/signing_up.dart';
import 'package:check_flutter/themes.dart';
import 'package:flutter/material.dart';
import 'package:check_flutter/screens/home_screen.dart';
import 'package:check_flutter/screens/hotel_screen.dart';
import 'package:check_flutter/screens/add_organization_screen.dart';
import 'package:check_flutter/screens/cinema_screen.dart';
import 'package:check_flutter/screens/food_screen.dart';
import 'package:check_flutter/screens/liquor_store.dart';
import 'package:check_flutter/screens/park_screen.dart';
import 'package:check_flutter/screens/loading_screen.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    Hive.box('storage').close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('storage'),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.done){
          if(snapshot.hasError){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Text(
                    snapshot.error.toString(),
                    ),
                    ),
                    ),
                    );
          }else if(snapshot.hasData){
            return FutureBuilder(
              future: Hive.openBox('storage'),
              builder: (context, snapshot) {
                return MaterialApp(
              debugShowCheckedModeBanner: false,
                  
          theme:ThemeData.light().copyWith(
          ),
          darkTheme: ThemeData.dark(),
          themeMode: Provider.of<CustomTheme>(context).isDarkMode? ThemeMode.dark:ThemeMode.light,
          initialRoute: LoadingScreen.route,
          routes: {
                HomeScreen.route: (context)=>HomeScreen(),
                HotelScreen.route: (context)=>HotelScreen(),
                CinemaScreen.route: (context)=>CinemaScreen(),
                FoodScreen.route : (context)=>FoodScreen(),
                ParkScreen.route: (context)=>ParkScreen(),
                LiquorScreen.route: (context)=>LiquorScreen(),
                SigningUpScreen.route:(context)=>SigningUpScreen(),
                LoadingScreen.route: (context)=>LoadingScreen(),
                LogingInScreen.route: (context)=>LogingInScreen(),
                AddOrganizationScreen.route: (context)=>AddOrganizationScreen(),
          },
        );
              }
            );
          }
        }
        else if(snapshot.connectionState==ConnectionState.waiting){
          return MaterialApp(
              debugShowCheckedModeBanner: false,
            home: Scaffold(body: Center(child: CircularProgressIndicator(),),),
          );
        }
        return MaterialApp(
              debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
          child: Text('please restart the app '),
          ),
          ),
          );
      }
    );
  }
}