

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PickingImages extends ChangeNotifier{

  File image;
  final picker = ImagePicker();


Future pickImage()async{
  final PickedFile pickedFile =await picker.getImage(source: ImageSource.gallery);
  await Permission.photos.request();
  var status=await Permission.photos.status;
  if(status.isGranted){
      if(pickedFile!=null){
        image= File(pickedFile.path);
      }else{
        return null;
      }
  }
  notifyListeners();
}
}

PickingImages pickingImages=PickingImages();