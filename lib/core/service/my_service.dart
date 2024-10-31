import 'dart:ffi';

import 'package:get/get.dart';
import 'package:products_api/core/constances/const_data.dart';
import 'package:products_api/core/service/shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyService extends GetxService {

  late SharedPreferences sharedPreferences;


  Future <MyService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }


  Future <void> SaveString(String key, String value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
  }

  Future<String?> GetString(String key) async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }

  Future <void> SetConstToken() async {
    ConstData.token =
    (await this.GetString(SharedPreferencesKey.tokenKey))!;
    ConstData.islogin=true;
  }

}
initialService()async{

  await Get.putAsync(() => MyService().init());

}