import 'package:mime/mime.dart';
import 'package:check_flutter/modules/picking_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';
import 'package:http_parser/http_parser.dart';

import '../../../../constants.dart';

class SubmittOrganizationLogo extends ChangeNotifier{

  Future submitImage(BuildContext context, String orgId)async{
      final String apiUrl= kApi + '/services/organization-gallery/';
      var url=Uri.parse(apiUrl);

      String path = Provider.of<PickingImages>(context, listen: false).image.path;

      final mimeTypeData = lookupMimeType(path, headerBytes:  [0xFF, 0xD8]).split('/');
      final imageUploadRequest= http.MultipartRequest('POST', url);

      final file = await http.MultipartFile.fromPath('image', path,
      contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));



      imageUploadRequest.files.add(file);
      imageUploadRequest.fields['organization']= orgId;
      imageUploadRequest.headers['Authorization']= 'Token $kSuperIdToken';

      try{
        final streamedResponse = await imageUploadRequest.send();
        final response = await http.Response.fromStream(streamedResponse);
        print(response.body);
        print(response.statusCode);
      }catch(e){
        print(e);
      }
      notifyListeners();
           
  }

}