import 'dart:async';
import 'package:flutter/cupertino.dart';
// import 'package:v15/config/routes/routes_name.dart';
// import 'package:v15/services/session_manager/session_controller.dart';
import 'package:v15_bloc_pattern/config/routes/routes_name.dart';
import 'package:v15_bloc_pattern/services/session_manager/session_controller.dart';


class SplashServices {
  void isLogin(BuildContext context) {

    SessionController().getUserFromPreference().then((value){
      if(SessionController().isLogin ?? false) {
        Timer(
          Duration(seconds: 3),
              () => Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesName.homeScreen,
                (route) => false,
          ),
        );
      }
      else{
        Timer(
          Duration(seconds: 3),
              () => Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesName.loginScreen,
                (route) => false,
          ),
        );
      }
    }).onError((error, stackTrace){
      Timer(
        Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.loginScreen,
              (route) => false,
        ),
      );
    });


  }
}
