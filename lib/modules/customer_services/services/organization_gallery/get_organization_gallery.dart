import 'dart:convert';
import 'package:check_flutter/modules/customer_services/services/organization_gallery/organization_image.dart';
import 'package:http/http.dart' as http;
import '../../../../constants.dart';



class GetOrganizationGallery{



  static Future<List<OrganizationImage>> getGallery()async{
  
        final String apiUrl=kApi + '/services/organization-gallery/';
      var url=Uri.parse(apiUrl);
      try{
            http.Response response = await http.get(url,
            headers:{"Authorization": 'Token $kSuperIdToken'},);

            if(response.statusCode==200){
            List organizationImageList= jsonDecode(response.body);
            var result = organizationImageList
            .map((json) => OrganizationImage.fromJson(json)).toList();
            return result;
            }
      }catch(e){
        print(e);
      }
      return null;
     }
  
  }
  
