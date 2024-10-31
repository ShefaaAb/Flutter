
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_api/binding/initialize_binding.dart';
import 'package:products_api/core/constances/routes.dart';
import 'package:products_api/routes.dart';
import 'package:products_api/view/auth/screen/register_account_screen.dart';
import 'package:products_api/view/auth/screen/sign_in_screen.dart';
import 'package:products_api/view/widgets/botton_nav_bar.dart';

import 'core/service/my_service.dart';

void main() async{
  runApp(const MyApp());
  MyService();
  await initialService();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitializeBinding(),
      getPages: routes,
      //initialRoute:Routes.homepage,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  RegisterAccountScreen(),

    );
  }
}
