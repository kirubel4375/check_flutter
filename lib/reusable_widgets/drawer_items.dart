import 'package:check_flutter/screens/Welcome/welcome_customers_screen.dart';
import 'package:check_flutter/screens/add_organization_screen.dart';
import 'package:check_flutter/screens/cinema_screen.dart';
import 'package:check_flutter/screens/food_screen.dart';
import 'package:check_flutter/screens/hotel_screen.dart';
import 'package:check_flutter/screens/liquor_store.dart';
import 'package:check_flutter/screens/organization_screen.dart';
import 'package:check_flutter/screens/park_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';



class DrawerItems extends StatelessWidget {
  const DrawerItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Hotel'),
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, HotelScreen.route);
          },

        ),
        ListTile(
          title: Text('cinema and clubs'),
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context,CinemaScreen.route);
          },
        ),
        ListTile(
          title: Text('park'),
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, ParkScreen.route);
          },
        ),
        ListTile(
          title: Text('liquor store'),
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context,LiquorScreen.route);
          },
        ),
        ListTile(title: Text('museum & exhibition'),),
        ListTile(
          title: Text('food'),
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, FoodScreen.route);
          },
        ),
        ListTile(title: Text('tour & travel cars'),),
        ListTile(title: Text('rental cars'),),
        ListTile(
          title: Text('organizations'),
          onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>OrganizationListScreen()));
          },
          ),
        ListTile(
          title: Text('add organization'),
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, AddOrganizationScreen.route);
          },
          ),
           ListTile(
          title: Text('log out',
          style: TextStyle(color: Colors.redAccent),
          ),
          onTap: (){
            Hive.box('storage').delete('userSignUpModel');
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
          },

        ),
      ],
    );
  }
}
