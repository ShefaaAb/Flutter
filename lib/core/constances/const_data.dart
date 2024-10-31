import 'dart:async';

class ConstData{

  static bool islogin=false;

  static String token ="";





  static Future<void> updateToken()async
  {

  }

  static Future<void> startTokenupdater() async{
    Timer.periodic(Duration(seconds: 20), (timer){

      updateToken();
    });

  }
}

