import 'package:check_flutter/screens/hotel_screen.dart';
import 'package:flutter/material.dart';
import 'circle_avatar_text.dart';



class ListCircleAvatarAndText {
List<AssetImageAndName> assetImageAndName=[
  AssetImageAndName(name:'Hotels', image: AssetImage('images/hotel_image.jpg'),),
  AssetImageAndName(name:'Food', image: AssetImage('images/burger_image.jpg')),
  AssetImageAndName(name:'Travel', image: AssetImage('images/travel_logo.png')),
  AssetImageAndName(name:'Parks', image: AssetImage('images/park_logo.jpg')),
  AssetImageAndName(name:'Cinemas', image: AssetImage('images/cinema_logo.jpg')),
  AssetImageAndName(name:'Museum', image: AssetImage('images/museum_image.jpg')),
  AssetImageAndName(name:'Car rentals', image: AssetImage('images/car_rental_logo.png')),
];

List<AssetImageAndName> forContainerBackGround= [
  AssetImageAndName(name:'Hotels', image: AssetImage('images/hotel_image.jpg'),),
  AssetImageAndName(name:'Food', image: AssetImage('images/pizza_image.jpg')),
  AssetImageAndName(name:'Travel', image: AssetImage('images/travel_image.jpg')),
  AssetImageAndName(name:'Parks', image: AssetImage('images/park_image.jpg')),
  AssetImageAndName(name:'Cinemas', image: AssetImage('images/cinema_image.jpg')),
  AssetImageAndName(name:'Museum', image: AssetImage('images/museum_image.jpg')),
  AssetImageAndName(name:'Car rentals', image: AssetImage('images/lambergini.jpg')),
];
}
ListCircleAvatarAndText listCircleAvatarAndText= ListCircleAvatarAndText();
