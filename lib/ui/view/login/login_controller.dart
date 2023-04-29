import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../infrastructure/services/api_service.dart';
import '../home/home_view.dart';
import '../register/register_view.dart';

class LoginController extends GetxController {
  final _apiService = ApiService();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool obscureText = true.obs;
  RxBool isLoading = false.obs;

  void onPressedObscureText() => obscureText.value = !obscureText.value;

  Future<void> _signinProcess() async {
    isLoading.value = true;
    String email = emailController.text;
    String password = passwordController.text;

    Either<String, bool> results = await _apiService.getSignin(emailOrPhone: email, password: password);

    results.fold(
      (errorMessage) => Get.snackbar('Error', errorMessage),
      (success) => Get.off(const HomeView()),
    );
    isLoading.value = false;
  }

  void onPressedLogin() {
    if (formKey.currentState!.validate()) _signinProcess();
  }

  void onTabToRegister() => Get.to(const RegisterView());
}
