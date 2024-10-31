import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_api/core/classes/crud.dart';
import 'package:products_api/core/classes/status_request.dart';
import 'package:products_api/core/constances/const_data.dart';
import 'package:products_api/core/service/app_link.dart';
import 'package:products_api/view/auth/screen/sign_in_screen.dart';
import 'package:products_api/view/widgets/botton_nav_bar.dart';

class AuthController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;
  String responseMessage = '';
  StatusRequest response = StatusRequest.loading;


  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    Either<StatusRequest, String> result = await Crud().postData(
        AppLink.login,
        {
          'email': this.emailController.text,
          'password': this.passwordController.text,
          'fcm_token': 'fafasdfsdfsdf5419dfaf5f'
        },
        getHeader(),
        true);
    result.fold((left) {
      this.response = left;
      Get.snackbar('message', response.toString());
      update();
      if (this.response == StatusRequest.success) {
        Get.off(() => BottonNavBar());
      }
    }, (right) {
      this.responseMessage = right;
      Get.defaultDialog(title: responseMessage);
    });
    print(ConstData.token);
  }

  Future<void> register() async {
    Either<StatusRequest, String> result = await Crud().postData(
        AppLink.register,
        {
          'name':nameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'fcm_token': 'fafasdfsdfsdf5419dfaf5f'
        },
        getHeader(),
        true);
    result.fold((left) {
      this.response = left;
      Get.snackbar('message', response.toString());
      update();
      if (this.response == StatusRequest.success) {
        Get.off(() => BottonNavBar());
      }
    }, (right) {
      this.responseMessage = right;
      Get.defaultDialog(title: responseMessage);
    });
    print(ConstData.token);
  }

  Future<void> logout() async {
    Either<StatusRequest, String> result =
        await Crud().postData(AppLink.logout, {}, getHeadersToken(), false);
    result.fold((left) {
      this.response = left;
      Get.snackbar('message', response.toString());
      update();
      if (this.response == StatusRequest.success) {
        Get.off(() => SignInScreen());
      }
    }, (right) {
      this.responseMessage = right;
      Get.defaultDialog(title: responseMessage);
    });
  }
}
