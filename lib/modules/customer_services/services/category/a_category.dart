class Acategory{


  Acategory({this.name, this.id});

  String name;
  String id;

  Acategory.fromJson(Map<String, dynamic> json)
  : id=json['id'],
  name=json['name'];
}