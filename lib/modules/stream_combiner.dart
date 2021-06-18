import 'package:check_flutter/modules/customer_services/services/organization_gallery/create_image_streams.dart';
import 'package:check_flutter/modules/customer_services/services/organization_gallery/organization_image.dart';
import 'package:check_flutter/modules/customer_services/services/organizations/an_organization.dart';
import 'package:check_flutter/modules/customer_services/services/organizations/create_streams.dart';
import 'package:check_flutter/modules/general_image.dart';
import 'package:rxdart/rxdart.dart';

class StreamCombiner{


  Stream<List<GeneralImage>> get combineListStreams{
    return CombineLatestStream.combine2(
    organizationManager.foodOrganization, 
    imageStreamManager.organizationImageList,
     (List<OrganizationGeneral> orgGenerals, List<OrganizationImage> orgImages) {
       List<GeneralImage> listGeneralImage= orgGenerals.map((orgGeneral){
         final orgImage = 
         orgImages?.firstWhere(
           (element) => element.organization== orgGeneral.id,
           orElse: ()=>null
           );
         return GeneralImage(
           organizationGeneral: orgGeneral,
            organizationImage: orgImage,
         );
       } ).toList();
       return listGeneralImage;
     });

  }

  // Stream<List<GeneralImage>> get getCombinedStreams => _combineListStreams();
     }

StreamCombiner streamCombiner = StreamCombiner();