import 'dart:io';
import 'package:flutter/cupertino.dart';

class OrganizationUpload extends ChangeNotifier{

     String _name;
     String _categoryName;
     String _categoryId;
     String _location;
     String _openTime;
     String _closeTime;
     File _logo;


 void setCategoryName(String categoryName){
   this._categoryName=categoryName;
   notifyListeners();

 }
 String get categoryName=>_categoryName;

 void setCategoryId(String categoryId){
   this._categoryId=categoryId;
   notifyListeners();

 }
 String get categoryId=>_categoryId;

 void setName(String name){
   this._name=name;
   notifyListeners();
}
 String get name=>_name;
void setLocation(String location){
  this._location=location;
  notifyListeners();
}
 String get location=>_location;

void setOpenTime(String time){
  _openTime=time;
  notifyListeners();

}
 String get openTime=>_openTime;

void setCloseTime(String time){
  _closeTime=time;
  notifyListeners();

}
 String get closeTime=>_closeTime;

void setLogo(File logo){
  this._logo=logo;
  notifyListeners();
}
 File get logo=>_logo;



}

