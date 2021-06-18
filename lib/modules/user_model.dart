import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 3)
class UserSignUpModel {

// sign up response
//   {
//     "id": "5070865f-c6a7-40dc-8cc3-359b0779bf54",
//     "username": "kalkidan",
//     "first_name": null,
//     "last_name": null,
//     "phone": null,
//     "email": null,
//     "is_active": true,
//     "is_staff": false,
//     "is_superuser": false,
//     "is_organization": false,
//     "address": null,
//     "date_joined": "2021-05-23T23:16:15.994818Z",
//     "last_login": null,
//     "profile_picture": null
// }

// log in response
// {
//     "user": {
//         "id": "5070865f-c6a7-40dc-8cc3-359b0779bf54",
//         "username": "kalkidan",
//         "first_name": null,
//         "last_name": null,
//         "phone": null,
//         "email": null,
//         "is_active": true,
//         "is_staff": false,
//         "is_superuser": false,
//         "is_organization": false,
//         "address": null,
//         "date_joined": "2021-05-23T23:16:15.994818Z",
//         "last_login": null,
//         "profile_picture": null
//     },
//     "token": "74e3593ca5514207e7ac6c6cd1b63010fa6cbe4c"
// }
  @HiveField(3)
  final String username;
  @HiveField(4)
  final String id;
  @HiveField(5)
  final String profile_picture;
  @HiveField(6)
  final String first_name;
  @HiveField(7)
  final String last_name;
  @HiveField(8)
  final String phone;
  @HiveField(9)
  final String email;

  UserSignUpModel.fromJson(Map<String, dynamic> json)
    :username=json["username"],
    id= json["id"],
    profile_picture=json["profile_picture"],
    first_name=json["first_name"],
    last_name=json["last_name"],
    phone=json["phone"],
    email=json["email"];



    UserSignUpModel({this.id, 
    this.email, this.first_name, 
    this.last_name, this.phone, 
    this.profile_picture, 
    this.username});
}