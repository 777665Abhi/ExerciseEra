import 'package:dio/dio.dart';

class AuthParams{


     registerAuth({
       var mobileNumber,
       var languageLocale,
       var deviceToken,
     }){
       return FormData.fromMap({
         "mobile_number":mobileNumber,
         "language":languageLocale,
         "device_token":deviceToken,
       });}


     loginAuth({
       var username,
       var password,
       var  bearer,
       var signIn,
     }){
       return FormData.fromMap({
         "username":username,
         "password":password,
         "Signin":signIn,
         "bearer":bearer,
       });}

     logoutAuth({
       var token,
     }){
       return FormData.fromMap({
         "token":token,
       });}






}

