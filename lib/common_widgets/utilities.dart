import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/exports.dart';

final localStorage = GetStorage();

newScreen({context,screen}){
  return Navigator.push(context,
      MaterialPageRoute(builder:
  (context) =>
  screen
      ) );
}
 void logPrint(String s) {
  debugPrint("log:$s");
  }

   setStatusBarColor({appbarColor,statusBarColor}){

  return  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(

      // systemNavigationBarColor: appbarColor, // navigation bar color
      statusBarColor:statusBarColor // status bar color
  ));
   }



   lockScreenRotations(){

  return  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
   }

disableKeyboard(){
  return FocusManager.instance.primaryFocus?.unfocus();
}

back(context){

  return Navigator.pop(context);
}