import 'dart:io';

Future CheckInternet() async{

  try{

  var result=await InternetAddress.lookup('google.com');
  if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){

    return true;
  }

  } on SocketException catch(e){
    return false;
  }

}