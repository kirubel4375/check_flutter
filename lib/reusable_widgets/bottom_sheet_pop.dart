import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(url)async=> await canLaunch(url)? await launch(url): throw 'could not laucnch $url';


Widget bottomSheetPop(BuildContext context){
  return Container(
    height:330,
    padding: EdgeInsets.only(left: 10, right: 10,bottom: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient:LinearGradient(
          colors: [Colors.blue,Colors.red],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
      ),
    ),
    child: Stack(
      children: [
        Text(
          'location',
          style: TextStyle(fontSize: 40),
        ),
        Positioned(
          top:44,
          child: Row(
            children: [
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star_outline_outlined),
              Icon(Icons.star_outline_outlined),
            ],
          ),
        ),
        Positioned(
          top: 80,
          child: Row(
            children: [
              Icon(Icons.favorite_outline,size: 45),
              SizedBox(width: 50,),
              Text('name',
                style: TextStyle(
                  fontSize: 44,
                ),
              ),
            ],
          ),
        ),

        Positioned(
          bottom: MediaQuery.of(context).orientation.index==0?80:50,
          child: Row(
            children: [
              Text('price: fjdhfjdhfjd',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(width: 70,),
              ElevatedButton(
                onPressed: (){
                  launchURL('tel:+251948211543');
                },
                child: Row(
                  children: [
                    Icon(Icons.call),
                    SizedBox(width: 20,),
                    Text('Call',
                      style: TextStyle(color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 30,
          child: Text('Number of rooms left  15',
            style: TextStyle(fontSize: 20,),
          ),
        ),
      ],
    ),
  );
}