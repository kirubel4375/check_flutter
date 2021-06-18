import 'package:check_flutter/modules/customer_services/services/organizations/an_organization.dart';
import 'package:check_flutter/modules/customer_services/services/organizations/create_streams.dart';
import 'package:flutter/material.dart';


class OrganizationListScreen extends StatefulWidget {
  @override
  _OrganizationListScreenState createState() => _OrganizationListScreenState();
}

class _OrganizationListScreenState extends State<OrganizationListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text('Organizations'),
        ),
        body: StreamBuilder<List<OrganizationGeneral>>(
          stream: organizationManager.organizationList,
          builder: (BuildContext context, AsyncSnapshot snapshot){
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

          return Center(child: CircularProgressIndicator());
        
        },
        ),
      ),
    );
  }
}

