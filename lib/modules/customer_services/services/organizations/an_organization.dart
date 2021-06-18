

class OrganizationGeneral{
  // {
  // "id": "1FP92USAZT",
  // "created_at": "2021-05-22T21:22:13.280653Z",
  // "updated_at": null,
  // "name": "club name 1",
  // "open": "21:00:00",
  // "close": "21:00:00",
  // "logo": null,
  // "location": "Ethiopika",
  // "category": "food",
  // "user": "dd8ba16e-771a-4b31-9105-b9eb63d4c6b7"
  // }

  String id;
  String name;
  String category;
  String location;
  var logo;



  OrganizationGeneral.fromJson(Map<dynamic, dynamic> json)
  : id=json['id'],
  name=json['name'],
  category=json['category'],
  location=json['location'],
  logo=json['logo'];
}