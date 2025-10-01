import 'dart:convert';
import 'package:flutter/cupertino.dart';

import '../../model/user/user_model.dart';
import '../storage/local_storage.dart';

// import 'package:v15/model/user/user_model.dart';
// import 'package:v15/services/storage/local_storage.dart';

class SessionController {

  static final SessionController _session = SessionController._internal();

  final LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();

  bool? isLogin;

  SessionController._internal(){
    isLogin = false;
  }

  factory SessionController(){
    return _session;
  }


  Future<void> saveUserInPreference(dynamic user) async {
     localStorage.setValue('token', jsonEncode(user));
  //   Storing value to check login
    localStorage.setValue('isLogin', 'true');
  }


  Future<void> getUserFromPreference() async {
    try{
      var userData = await localStorage.readValue('token');
      var isLogin = await localStorage.readValue('isLogin');

      if(userData.isNotEmpty) {
        SessionController().user = UserModel.fromJson(jsonDecode(userData));
      } else {
        SessionController().isLogin = isLogin == 'true' ? true : false;
      }

    }catch(e){
      debugPrint(e.toString());

    }
  }


}