import 'dart:convert';
import 'package:check_flutter/constants.dart';
import 'package:check_flutter/modules/customer_services/services/organizations/an_organization.dart';
import 'package:check_flutter/modules/customer_services/services/organizations/organization_upload.dart';
import 'package:check_flutter/modules/enum.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../user_model.dart';

class OrganizationApi extends ChangeNotifier{

  Future<http.Response> addOrganization(BuildContext context)async{
    final _userSignUpModel = Hive.box('storage').get('userSignUpModel') as UserSignUpModel;
    String userId = _userSignUpModel.id;
    final String apiUrl= kApi + '/services/organizations/';
    var url=Uri.parse(apiUrl);
    http.Response response;
    try{
      print("trying");

    response= await http.post(url,
      headers:{ "Authorization": 'Token $kSuperIdToken',},
      body:  {
        "category": Provider.of<OrganizationUpload>(context, listen: false).categoryId,
        "name": Provider.of<OrganizationUpload>(context,listen: false).name,
        "open": '21:13:00',
        "close": '10:32:11',
        "user": userId,
        "location": Provider.of<OrganizationUpload>(context, listen:false).location
      },
    );
    print("executed");
    print(response.body);
    print(response.statusCode);
    
      notifyListeners();
      return response;

    }catch(e){
      print(e);
    }
    
    notifyListeners();
    return null;
    

 
  }
  static Future<List<OrganizationGeneral>> getOrganizations(SelectCategory selectedCategory)async{
    final String apiUrl=kApi + '/services/organizations/';
    var url=Uri.parse(apiUrl);
    try{
      http.Response response= await http.get(url,
        headers:{ "Authorization": 'Token $kSuperIdToken',},
      );
      // print(response.body);
      if(response.statusCode==200){
        List organizationList= jsonDecode(response.body);
         var result=
        organizationList.map((json) => OrganizationGeneral.fromJson(json));
        List<OrganizationGeneral> foodCollections= [];
        List<OrganizationGeneral> hotelCollections=[];
        List<OrganizationGeneral> clubCollections=[];
        List<OrganizationGeneral> cinemaCollections=[];
        List<OrganizationGeneral> justOrganizations=[];
          for(var oneOrg in result){
            if(oneOrg.category=='9a4c8023-799c-4b2a-a0c4-f3801040e831'){
              foodCollections.add(oneOrg);
          }
          else if(oneOrg.category=='27b89c1a-e27a-407d-ad47-5f872602427c'){
          hotelCollections.add(oneOrg);
          }
          else if(oneOrg.category=='club'){
            clubCollections.add(oneOrg);
          }else if(oneOrg.category=='cinema'){
            cinemaCollections.add(oneOrg);
          }
          else{
            justOrganizations.add(oneOrg);
          }
        }

        if(selectedCategory==SelectCategory.foodType){
          return foodCollections;
        }
        else if(selectedCategory==SelectCategory.hotelType){
          return hotelCollections;
        }
        else if(selectedCategory==SelectCategory.clubType){
          return clubCollections;
        }else if(selectedCategory==SelectCategory.cinemaType){
          return cinemaCollections;
        }
        else{
          return justOrganizations;
        }
        
      }
    }
    catch(e){
      print(e);
    }
    return null;
  }
  deleteOrganization(){


  }
  updateOrganization(){

  }
  getAnOrganizationDetail(){

  }
  addOrganizationReview(){

  }
  getOrganizationReview(){

  }
  updateOrganizationReview(){

  }
  deleteOrganizationReview(){

  }


}

//  Provider.of<OrganizationUpload>(context, listen: false).closeTime.toString()??
//  Provider.of<OrganizationUpload>(context, listen: false).openTime.toString()?? 