
import '../constances/const_data.dart';

class AppLink {
  //remote Address
  static String appRoot = 'https:/';
  // static String imageWithRoot="$appRoot/storage/";
  //
  // static String imageWithoutRoot="$appRoot"; //??

  static String serverApiRoot = "$appRoot/task.focal-x.com/api";

  static String register = "$serverApiRoot/register";
  static String login = "$serverApiRoot/login";
  static String logout = "$serverApiRoot/logout";

  static String all_category = "$serverApiRoot/categories";
  static String sub_categories = "$serverApiRoot/sub/categories";

  static String all_product = "$serverApiRoot/products";
  static String product = "$serverApiRoot/products/2";

  static String order = "$serverApiRoot/orders";

//local Address
//static String reg="127.0.0.1";


}

  Map<String, String> getHeader () {

    Map<String,String> mainHeader = {
      'Accept': 'application/json' ,
    };
    return mainHeader;
  }

  Map<String, String> getHeadersToken() {

    Map<String,String> mainHeader={
      'Accept': 'application/json',
      "Authorization": "Bearer ${ConstData.token}"
    };

    return mainHeader;
  }




