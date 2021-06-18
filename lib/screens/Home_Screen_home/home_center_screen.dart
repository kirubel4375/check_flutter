import 'package:check_flutter/modules/components/list_circle_avatar_text.dart';
import 'package:check_flutter/screens/category_screen.dart';
import 'package:check_flutter/screens/cinema_screen.dart';
import 'package:check_flutter/screens/hotel_screen.dart';
import 'package:check_flutter/screens/park_screen.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../food_screen.dart';

class HomeCenterScreen extends StatefulWidget {
  @override
  _HomeCenterScreenState createState() => _HomeCenterScreenState();
}

class _HomeCenterScreenState extends State<HomeCenterScreen> {




  IconData _iconData = Icons.expand_more;

  void changeExpandeMore() {
    if (_iconData == Icons.expand_more) {
      setState(() {
        _iconData = Icons.expand_less;
      });
    } else {
      setState(() {
        _iconData = Icons.expand_more;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kHomePadding,
      child: Column(
          mainAxisSize: MainAxisSize.min,
           children: [
             ListTile(
               title: Text(
       "Addis Ababa",
       style: TextStyle(
         fontWeight: FontWeight.bold,
         fontSize: 23,
       ),
               ),
               subtitle: Text(
       '${DateTime.now().toString()}',
       style: TextStyle(color: Colors.grey),
               ),
               trailing: CircleAvatar(
       radius: 40,
       child: Image.asset('images/avatar_image.png'),
               ),
             ),
             Container(
               padding: EdgeInsets.only(
       top: 25.0,
       right: 16,
       bottom: 12.0,
               ),
               child: TextField(
       decoration: InputDecoration(
         hintText: "search for anything...",
         filled: true,
         prefixIcon: Icon(
           Icons.search,
           color: Theme.of(context).textTheme.bodyText1.color,
         ),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.all(Radius.circular(13.0)),
         ),
       ),
               ),
             ),
             Expanded(
               child: ListView.builder(
       scrollDirection: Axis.horizontal,
       itemCount: 4,
       itemBuilder: (context, index) {
         return Container(
           padding: const EdgeInsets.symmetric(vertical: 10.0),
           child: Container(
             decoration: BoxDecoration(
           color: Color(0xffEBEBEB),
               borderRadius: BorderRadius.circular(10),
      ),
      height: 150,
             width: 350,
           ),
         );
       },
               ),
             ),
             Padding(
               padding: EdgeInsets.only(top:6.0, bottom: 20.0, right: 10.0, left: 10.0),
               child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text('Top services'),
         Text('see all'),
       ],
               ),
             ),
             Expanded(
               child: ListView.builder(
       scrollDirection: Axis.horizontal,
       itemCount: listCircleAvatarAndText.assetImageAndName.length,
       itemBuilder: (context, index) {
         return Padding(
           padding: const EdgeInsets.all(5.0),
           child: Column(
             children: [
               GestureDetector(
       onTap: (){
         if(index==0){
           Navigator.pushNamed(context, HotelScreen.route);
         }
         else if(index==1){
          Navigator.pushNamed(context, FoodScreen.route);
         }
          else if(index==2){
            Navigator.push(context, MaterialPageRoute(builder: (contex)=>CategoryScreen()));
          }else if(index==3){
            Navigator.pushNamed(context, ParkScreen.route);
          }else if(index==4){
            Navigator.pushNamed(context, CinemaScreen.route);
          }else if(index==5){

          } else if(index==6){
            
          }                         
            
       },
       child: CircleAvatar(
         radius: 40,
         backgroundImage: listCircleAvatarAndText.assetImageAndName[index].image,
       ),
               ),
               SizedBox(height: 7.0),
               Text(listCircleAvatarAndText.assetImageAndName[index].name),
             ],
           ),
         );
       },
               ),
             ),
             Padding(
               padding: EdgeInsets.only(bottom: 5.0, right :10.0, left: 10.0),
               child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text('Recommended for you'),
         IconButton(
           icon: Icon(
             _iconData,
           ),
           onPressed: changeExpandeMore,
         ),
       ],
               ),
             ),
             Expanded(
               child: ListView.builder(
       scrollDirection: Axis.horizontal,
       itemCount: 7,
       itemBuilder: (context, index) {
         return Container(
           width: 100,
           decoration: BoxDecoration(
             color: Color(0xffEBEBEB),
             borderRadius: BorderRadius.circular(10)),
           
         );
       },
               ),
             ),
           ],
            ),
    );
  }
}

// CustomPaint(
//         painter: MyPainter(),
//             child: Container(
//             child: Card(
//               elevation: 0.0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//                 child: ListView(
//                 children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//               UpperButton(
//                 onPressed: (){
//                   Navigator.pushNamed(context, HotelScreen.route);
//                 },
//                 buttonName: 'Hotel',
//                 rightSizeMargin: 8.0,
//               ),
//               UpperButton(
//                 onPressed: (){
//                 },
//                 buttonName: 'package',
//                 rightSizeMargin: 8.0,
//               ),
//               UpperButton(
//                 onPressed: (){
//                   Navigator.pushNamed(context, FoodScreen.route);
//                 },
//                 buttonName: 'food',
//                 rightSizeMargin: 0.0,
//               )
//           ],
//         ),
//         SizedBox(height: MediaQuery.of(context).size.height/15,),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 25),
//           height: MediaQuery.of(context).size.height/8,
//           decoration: BoxDecoration(
//                 color: Colors.black12,
//                 borderRadius: BorderRadius.circular(30)
//           ),

//           child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
//                         hintText: 'ቦታ/መዳረሻ'

//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10,),
//                 Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: IconButton(icon: Icon(Icons.search), onPressed: () {})),
//               ],
//           ),
//         ),
//         SizedBox(height: MediaQuery.of(context).size.height/15,),
//         Container(
//           height: MediaQuery.of(context).size.height/8,
//           decoration: BoxDecoration(
//                 color: Colors.black12,
//                 borderRadius: BorderRadius.circular(30)
//           ),
//           child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 OutlinedButton(
//                   onPressed: () {},
//                   child: Text(
//                     'ዋጋ',
//                     style: TextStyle(
//                       fontSize: 25,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 30),
//                 OutlinedButton(
//                   onPressed: () {},
//                   child: Text(
//                     'የሰው ብዛት',
//                     style: TextStyle(
//                       fontSize: 25,
//                     ),
//                   ),
//                 ),
//               ],
//           ),
//         ),
//         SizedBox(height: MediaQuery.of(context).size.height/15,),
//         Wrap(
//           // mainAxisAlignment: MainAxisAlignment.center,
// // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//               Text(
//                 'ቀን ከ ',
//                 style: TextStyle(
//                   fontSize: 25,
//                 ),
//               ),
//               SizedBox(width: 20,),
//               OutlinedButton(
//                 child: Text(
//                   Provider.of<SelectDate>(context).firstSelect.toString().split(" ")[0] ==
//                       DateTime.now().toString().split(" ")[0]
//                       ? '  '
//                       : '${Provider.of<SelectDate>(context).firstSelect}'.split(" ")[0],
//                 ),
//                 onPressed: () => Provider.of<SelectDate>(context,listen: false).selectDate(context,
//                     selectedDate: SelectedDate.dateBeginning),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   '-',
//                   style: TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//               OutlinedButton(
//                 child: Text('${Provider.of<SelectDate>(context).secondSelect}'.split(" ")[0] ==
//                     DateTime.now()
//                         .add(Duration(days: 10))
//                         .toString()
//                         .split(" ")[0]
//                     ? '  '
//                     : '${Provider.of<SelectDate>(context).secondSelect}'.split(" ")[0]),
//                 onPressed: () => Provider.of<SelectDate>(context,listen: false).selectDate(context,
//                     selectedDate: SelectedDate.dateEnd),
//               ),
//           ],
//         ),
//         SizedBox(height: MediaQuery.of(context).size.height/10,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//               Expanded(
//                 child: TextField(
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                     hintText: 'search',
//                   ),
//                 ),
//               ),
//               SizedBox(width: MediaQuery.of(context).size.width / 10),
//               IconButton(icon: Icon(Icons.search), onPressed: () {})
//           ],
//         ),
//                 ],
//               ),
//             ),
//           ),
//       );
