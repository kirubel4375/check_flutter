import 'package:check_flutter/reusable_widgets/app_bar_button.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomDialogBox extends StatefulWidget {

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.padding)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(Constants.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.redAccent,
                offset: Offset(0, 10),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'location',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 15,
              ),
              Text("price ETB 342",
                style: TextStyle(fontSize: 30),

              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'time  '+'${DateTime.now()}'.split(' ')[0],
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Iconbutton(
                              onPressed: (){},
                              icon: Icons.sms,
                            ),
                            Text('sms'),
                          ],
                        ),
                        SizedBox(width: 18,),
                        Column(
                          children: [
                            Iconbutton(
                              onPressed: (){},
                              icon: Icons.call,
                            ),
                            Text('call'),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: FlutterLogo(size: 100,),
            ),
          ),
        ),
      ],
    );
  }
}
