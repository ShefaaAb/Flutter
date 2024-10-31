import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:products_api/core/classes/check_internet.dart';
import 'package:products_api/core/classes/status_request.dart';
import 'package:http/http.dart' as http;
import 'package:products_api/core/service/my_service.dart';
import 'package:products_api/core/service/shared_preferences_key.dart';

class Crud{


 Future<Either<StatusRequest,String >> postData(
     String LinkUrl ,Map body , Map<String,String> header,bool tosaveToken
     ) async{
   try{
     if (await CheckInternet())
     {
       var Url= Uri.parse(LinkUrl);
       var response= await http.post(
           Url,
           body: body,
           headers: header );
       print('status code');
       print(response.statusCode);

       print('response :$response');

       var decodeResponse=json.decode(response.body);
       print('1');
       if(response.statusCode==200 || response.statusCode==201)
       {
         print('2  statusCode succes');
         if(tosaveToken==true)
           {
             var token= decodeResponse['data']['access_token'];
             await MyService().SaveString(SharedPreferencesKey.tokenKey, token);
             await MyService().SetConstToken();
           }
         print('2 succes');
         return Left(StatusRequest.success);
         // Map responseBody=jsonDecode(response.body);
         // print (response.body);
         // return Right(responseBody);
       }
       else {
         var message=decodeResponse['message'];
         return Right(message);
       }

     }
     else{
       return const Left(StatusRequest.offLineFailure);
     }

   } on HttpException catch(e){
     return Left(StatusRequest.serverFailure);
   }

 }
 Future<Either<StatusRequest, Map>> getData(
     String LinkUrl, Map<String, String> header, bool tosaveToken) async {
   try {
     if (await CheckInternet()) {
       var Url = Uri.parse(LinkUrl);
       var response = await http.get(
         Url,
         headers: header,
       );
       print('status code: ${response.statusCode}');

       if (response.statusCode == 200 || response.statusCode == 201) {
         // فك ترميز بيانات response.body إلى JSON
         var decodeResponse = json.decode(response.body);
         //print('decoded response: $decodeResponse');

         return Right(decodeResponse);  // إرجاع البيانات المفككة كـ Right
       } else {
         var decodeResponse = json.decode(response.body);
         var message = decodeResponse['message'];
         return Right({"message": message});  // إرجاع رسالة الخطأ
       }
     } else {
       return const Left(StatusRequest.offLineFailure);
     }
   } on HttpException catch (e) {
     return Left(StatusRequest.serverFailure);
   }
 }

}