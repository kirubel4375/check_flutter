import 'package:check_flutter/reusable_widgets/grid_count.dart';
import 'package:check_flutter/reusable_widgets/drawer_items.dart';
import 'package:check_flutter/reusable_widgets/path_painter.dart';
import 'package:check_flutter/screens/food_screen.dart';
import 'package:check_flutter/screens/google_maps_screen.dart';
import 'package:check_flutter/themes.dart';
import 'package:flutter/material.dart';
import 'package:check_flutter/reusable_widgets/app_bar_button.dart';
import 'package:check_flutter/modules/enum.dart';
import 'package:check_flutter/screens/hotel_screen.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../date_selector.dart';
import 'Home_Screen_home/home_center_screen.dart';


class HomeScreen extends StatefulWidget {
  static final String route = 'home_screen';
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

      IconData modeIcon;

     
      void modeIconAssigner(){
         if(Hive.box('storage').get('isDarkMode')!=null){
           if(Hive.box('storage').get('isDarkMode')){
             modeIcon=Icons.light_mode;
           }else{
             modeIcon= Icons.dark_mode;
           }
      }else{
        modeIcon=Icons.dark_mode;
      }
      }

  void modeIconToggle(){
    if(modeIcon==Icons.dark_mode){
      setState(() {
        modeIcon=Icons.light_mode;
      });
    }else{
      setState(() {
        modeIcon=Icons.dark_mode;
      });

    }
  }


  TabController bottomAppBarTab;


  @override
  void initState() {
    super.initState();
    bottomAppBarTab=TabController(length: 2, vsync: this);
    modeIconAssigner();
  }

  @override
  void dispose() {
    super.dispose();
    bottomAppBarTab.dispose();
  }
  int _currentTabIndex=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _currentTabIndex==0? null: AppBar(
          elevation: 0.0,
          bottom:_currentTabIndex==2?TabBar(
            controller: bottomAppBarTab,
              tabs:[
                Tab(icon: Icon(Icons.tour),),
                Tab(icon: Icon(Icons.car_rental),),
              ],
          ):null,
          actions: [
            Iconbutton(
              icon: modeIcon,
              onPressed: (){
                Provider.of<CustomTheme>(context, listen: false).toggleDarkMode();
                modeIconToggle();
              },
            )
          ],
          title: Text(
          'Customer Service',
        ),
        ),
        drawer: Material(
          child: Drawer(
            child: DrawerItems(),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          currentIndex: _currentTabIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (x){
              setState(() {
                _currentTabIndex=x;
              });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined),
                activeIcon: Icon(Icons.location_on),
                label: 'location'),
            BottomNavigationBarItem(icon: Icon(Icons.local_taxi),label: 'cars'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                activeIcon: Icon(Icons.favorite),
                label: 'fav'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'profile')
          ],
        ),
        body: returnBody(_currentTabIndex, context),
      ),
    );
  }
  Widget returnBody(int index, BuildContext context){
    if(index==0){
      return HomeCenterScreen();
    }
    else if(index==1){
      return GoogleMapsScreen();
    }
    else if(index==2){
      return TabBarView(
        controller: bottomAppBarTab,
          children: [
            GridCount(
              crossAxisCount: MediaQuery.of(context).orientation.index==0?2:3,

              action: 'Tour & Travel Cars',
              name: 'name',
              scrollDirection: Axis.vertical,
              onTap: (){

              },
            ),
            GridCount(
              crossAxisCount: MediaQuery.of(context).orientation.index==0?2:3,
              action: 'Rental Cars',
              name: 'name',
              scrollDirection: Axis.vertical,
            )
          ],
      );
    }
    else if(index==3){
      return Icon(Icons.favorite_outline, size: 66,);
    }else{
      return Icon(Icons.person_outline,size:66);
    }
  }
}

















