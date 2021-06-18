

class OrganizationImage {

  String organization;
  String image;
  String id;

  OrganizationImage.fromJson(Map<String, dynamic> json)
  :organization=json['organization'],
  image= json['image'],
  id = json['id'];
}