import 'package:check_flutter/modules/general_image.dart';
import 'package:check_flutter/modules/stream_combiner.dart';
import 'package:flutter/material.dart';


class FoodScreen extends StatelessWidget {
  static final String route='food_screen';
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Foods'),
        ),
        body: StreamBuilder<List<GeneralImage>>(
          stream: streamCombiner.combineListStreams,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){

                  List<GeneralImage> generalImage= snapshot.data;
                  
          return ListView.builder(
            itemCount: generalImage?.length?? 0,
            itemBuilder: (BuildContext context, int index){
              print(generalImage[index]?.organizationImage?.image);
              return Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    (generalImage[index].organizationImage!=null)? 
                    Container(
                      child: Image.network(generalImage[index]?.organizationImage?.image))
                    :Placeholder(),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Column(
                        children: [
                          Text(generalImage[index]?.organizationGeneral?.name),
                          Text(generalImage[index]?.organizationGeneral?.location)
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            );
          }
          return Center(child: CircularProgressIndicator());
        },
        ),
      ),
    );
  }
}




                //    NetworkImage(generalImage[index].organizationImage.image)
                //    decoration: BoxDecoration(
                //   image: (generalImage[index].organizationImage!=null)? DecorationImage(
                //     fit: BoxFit.cover,
                //     image:Placeholder(),
                //   ): Placeholder(),
                // ),