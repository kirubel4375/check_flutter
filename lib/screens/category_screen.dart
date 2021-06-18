import 'package:check_flutter/modules/components/list_circle_avatar_text.dart';
import 'package:check_flutter/screens/cinema_screen.dart';
import 'package:check_flutter/screens/park_screen.dart';
import 'package:flutter/material.dart';

import 'food_screen.dart';
import 'hotel_screen.dart';


class CategoryScreen extends StatelessWidget {
  static final String route= "category_screen";
  const CategoryScreen({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios),
          ),
          actions: [IconButton(
          icon: Icon(Icons.search),
          onPressed: (){Navigator.pop(context);},
          )],
      ),
      body: ListView.builder(
        itemCount: listCircleAvatarAndText.assetImageAndName.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              if(index==0){
           Navigator.pushNamed(context, HotelScreen.route);
         }
         else if(index==1){
          Navigator.pushNamed(context, FoodScreen.route);
         }
          else if(index==2){
          }else if(index==3){
            Navigator.pushNamed(context, ParkScreen.route);
          }else if(index==4){
            Navigator.pushNamed(context, CinemaScreen.route);
          }else if(index==5){

          } else if(index==6){
            
          }           
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 3.0),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20.0),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: listCircleAvatarAndText.forContainerBackGround[index].image,),
              ),
              child: Text(listCircleAvatarAndText.forContainerBackGround[index].name,
              style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
              ),
            ),
          );
        }),
    );
  }
}