import 'dart:async';
import 'package:check_flutter/modules/customer_services/services/organizations/an_organization.dart';
import 'package:check_flutter/modules/customer_services/services/organizations/organization_api.dart';
import 'package:check_flutter/modules/enum.dart';


class OrganizationManager{
Stream<List<OrganizationGeneral>> get organizationList async*{
     yield await OrganizationApi.getOrganizations(SelectCategory.justOrganization);
}

Stream<List<OrganizationGeneral>> get foodOrganization async*{
     yield await OrganizationApi.getOrganizations(SelectCategory.foodType);
}

Stream<List<OrganizationGeneral>> get hotelOrganization async*{
     yield await OrganizationApi.getOrganizations(SelectCategory.hotelType);
}
Stream<List<OrganizationGeneral>> get clubOrganization async*{
     yield await OrganizationApi.getOrganizations(SelectCategory.clubType);
}
Stream<List<OrganizationGeneral>> get cinemaOrganization async*{
     yield await OrganizationApi.getOrganizations(SelectCategory.cinemaType);
}


}

  OrganizationManager organizationManager=OrganizationManager();
