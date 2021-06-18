import 'package:check_flutter/modules/customer_services/services/category/a_category.dart';
import 'package:check_flutter/modules/customer_services/services/category/create_cat_stream.dart';
import 'package:check_flutter/modules/customer_services/services/category/temp.dart';
import 'package:check_flutter/modules/customer_services/services/organizations/organization_api.dart';
import 'package:check_flutter/modules/customer_services/services/organizations/organization_upload.dart';
import 'package:check_flutter/modules/customer_services/services/organizations/submit_org_logo.dart';
import 'package:check_flutter/modules/picking_images.dart';
import 'package:check_flutter/modules/progress_hud_loading_handler.dart';
import 'package:check_flutter/show_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class AddOrganizationScreen extends StatelessWidget {
  static final String route = 'add_organization_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Organization'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ProgressHudHandler>(context).isLoading,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Card(
              elevation: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * .8,
                padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'choose category',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            FutureBuilder<List<Acategory>>(
                                future: categoryManager.futureCategory,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasData) {
                                      final List<DropdownMenuItem<String>>
                                          _items = snapshot.data
                                              .map((e) {
                                                return DropdownMenuItem<String>(
                                                      value: e.name,
                                                      child: Text(e.name));
                                              
                                              }).toList();
                                              // ignore: missing_return
                                              int itemIndex(String value){
                                                for(Acategory category in snapshot.data){
                                                  if(category.name==value){
                                                    return snapshot.data.indexOf(category);
                                                  }
                                                }
                                              }

                                                  

                                      return DropdownButton(
                                        items: _items,
                                        value: Provider.of<OrganizationUpload>(
                                                context)
                                            .categoryName,
                                        onChanged: (String value) {
                                          Provider.of<OrganizationUpload>(
                                                  context,
                                                  listen: false)
                                              .setCategoryName(value);
                                          Provider.of<OrganizationUpload>(
                                                  context,
                                                  listen: false)
                                              .setCategoryId(
                                                  snapshot.data[itemIndex(value)].id);
                                        },
                                      );
                                    }
                                  } else if (snapshot.connectionState ==
                                          ConnectionState.waiting ||
                                      snapshot.connectionState ==
                                          ConnectionState.none) {
                                    return CircularProgressIndicator();
                                  }
                                  return Container();
                                }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'name',
                          ),
                          onChanged: temp.setName,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'location',
                          ),
                          onChanged: temp.setLocation,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'open time',
                            ),
                            TextButton(
                              onPressed: () async {
                                await Provider.of<TimePicker>(context,
                                        listen: false)
                                    .selectTime(context);
                              },
                              child: Text(
                                '${Provider.of<TimePicker>(context).selectedHour ?? '00'} : ${Provider.of<TimePicker>(context).selectedMinute ?? '00'}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                      fontSize: 25,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'close time',
                          ),
                        ),
                      ),
                      (Provider.of<PickingImages>(context).image == null)
                          ? Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                children: [
                                  Text('pick logo'),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2),
                                  IconButton(
                                    color: Theme.of(context).primaryColor,
                                    onPressed: () async {
                                      await Provider.of<PickingImages>(context,
                                              listen: false)
                                          .pickImage();
                                    },
                                    icon: Icon(Icons.image),
                                  ),
                                ],
                              ),
                            )
                          : Stack(
                              children: [
                                Image.file(
                                    Provider.of<PickingImages>(context).image),
                                Positioned(
                                  right: 3,
                                  bottom: 3,
                                  child: IconButton(
                                    color: Theme.of(context).primaryColor,
                                    onPressed: () async {
                                      await Provider.of<PickingImages>(context,
                                              listen: false)
                                          .pickImage();
                                    },
                                    icon: Icon(Icons.image),
                                  ),
                                ),
                              ],
                            ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      GestureDetector(
                        onTap: () async {
                          Provider.of<ProgressHudHandler>(context,
                                  listen: false)
                              .switchLoading();
                              Provider.of<OrganizationUpload>(context, listen: false).setName(temp.name);
                              Provider.of<OrganizationUpload>(context, listen: false).setLocation(temp.location);
                          final response = await Provider.of<OrganizationApi>(
                                  context,
                                  listen: false)
                              .addOrganization(context);
                               if (response != null) {
                            var data = jsonDecode(response.body);
                            String orgId = data['id'];
                            await Provider.of<SubmittOrganizationLogo>(context,
                                    listen: false)
                                .submitImage(context, orgId);
                          }

                          Provider.of<ProgressHudHandler>(context,
                                  listen: false)
                              .switchLoading();
                          Navigator.pop(context);
                          // showDialog(
                          //     context: context, builder:
                          // );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 22),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Center(
                            child: Text(
                              'Add',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// {
//     "category": "food",
//     "name": "club name 1",
//     "open": "21:00:00",
//     "close": "21:00:00",
//     "user": "dd8ba16e-771a-4b31-9105-b9eb63d4c6b7",
//     "location": "Ethiopika"
// }
