import 'dart:async';
import 'package:check_flutter/modules/customer_services/services/organization_gallery/get_organization_gallery.dart';
import 'organization_image.dart';


class ImageStreamManager{

  Stream<List<OrganizationImage>> get organizationImageList async*{
     yield await GetOrganizationGallery.getGallery();
}
}

ImageStreamManager imageStreamManager= ImageStreamManager();