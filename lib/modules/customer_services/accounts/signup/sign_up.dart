import 'dart:io';
import 'package:check_flutter/modules/user_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:check_flutter/constants.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import '../../../user_model.dart';

class SingUpUser extends ChangeNotifier{

  // ignore: missing_return
  Future<int> createUser(BuildContext context)async{
    final String apiUrl=kApi+'/accounts/signup/';
    var url=Uri.parse(apiUrl);

    try{
      final http.Response response=await http.post(url,
        headers: {
          "Authorization":kSuperIdToken,
        },
        body: {
          "username": Provider.of<UserHandler>(context, listen: false).username,
         "password": Provider.of<UserHandler>(context, listen: false).password
         },
      );

        if(response.statusCode==HttpStatus.created || response.statusCode==HttpStatus.ok){
        String responseBody=response.body;
        var _decodedData=jsonDecode(responseBody);
        UserSignUpModel userSignUpModel= UserSignUpModel.fromJson(_decodedData);
        Hive.box('storage').put('userSignUpModel',userSignUpModel);
      }else if(response.statusCode==HttpStatus.requestTimeout){


      }else if(response.statusCode==HttpStatus.badRequest){
        return 9;
        // user with user name already exists

      }else if (response.statusCode==HttpStatus.internalServerError){
        return 500;
      }

      notifyListeners();
      return response.statusCode;
    }on SocketException {
      return -1;
          }on HttpException{
            return 404;
          }on FormatException{
            return 2;
          }catch(e){
            print(e);
            return 6;
          }
        }
      }




      
class Failure {
  final String responseMessage;
  Failure(this.responseMessage);
  @override
  String toString() =>responseMessage;
}