import 'dart:convert';
import 'dart:io';
import 'package:check_flutter/modules/user_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart'as http;
import 'package:check_flutter/constants.dart';
import 'package:provider/provider.dart';

import '../../../user_model.dart';

class SignInUser extends ChangeNotifier{
  Future<int> checkForLogIn(BuildContext context)async{
    final String apiUrl=kApi+'/accounts/login/';
    var url=Uri.parse(apiUrl);
    http.Response logInResponse;
    try{
      logInResponse= await http.post(url,
          headers:{"Authorization":kSuperIdToken,},
          body: {
           "username": Provider.of<UserHandler>(context, listen: false).username,
           "password": Provider.of<UserHandler>(context, listen: false).password
           }
      );
      if(logInResponse.statusCode==HttpStatus.created || logInResponse.statusCode==HttpStatus.ok){
                        String responseBdy=logInResponse.body;
        var _decodedData=jsonDecode(responseBdy);
                var  _userInfo= _decodedData['user'];
        UserSignUpModel userSignUpModel= UserSignUpModel.fromJson(_userInfo);
        Hive.box('storage').put('userSignUpModel',userSignUpModel);
        return 201;
      }else if(logInResponse.statusCode==HttpStatus.unauthorized){
        // incorect user name or password incorrect
      }
      notifyListeners();
      print(logInResponse.body);
      return logInResponse.statusCode;


    }catch(e){
      
    }
    
    notifyListeners();
    return -1;
  }
}