import 'package:check_flutter/modules/customer_services/services/organizations/an_organization.dart';
import 'package:check_flutter/modules/customer_services/services/organizations/create_streams.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotelScreen extends StatefulWidget {
  static final String  route = 'hotel_screen';
  const HotelScreen({Key key}) : super(key: key);

  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Hotels'),),
        body: StreamBuilder<List<OrganizationGeneral>>(
          stream: organizationManager.hotelOrganization,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
              case ConnectionState.active:
              case ConnectionState.none: 
                    return Center(child: CircularProgressIndicator());
                    break;
              case ConnectionState.done:
                     if(snapshot.hasData){
                  List<OrganizationGeneral> organizationGeneral= snapshot.data;
          return ListView.builder(
            itemCount: organizationGeneral?.length?? 0,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                title: Text(organizationGeneral[index]?.name),
                subtitle: Text(organizationGeneral[index]?.location),
              );
            }
            );
          }
          break;           
            }
             return Center(child: TextButton(onPressed: (){}, child: Text('refresh'),),); 
        },
        ),
      ),
    );
  }
}




// Container(
//           margin: EdgeInsets.symmetric(vertical: 40),
//           child: GridView.count(
//               crossAxisCount: MediaQuery.of(context).orientation.index==0? 2:3,
//             // scrollDirection: Axis.horizontal,
//             children: List.generate(hotelLogos.length, (index) {
//               return CardReturn(
//                 child: hotelLogos[index],
//                 onPressed: (){
//                 showModalBottomSheet(context: context, builder: (context)=>bottomSheetPop(context));
//               },
//               );
//             }),
//           ),
//         ),
