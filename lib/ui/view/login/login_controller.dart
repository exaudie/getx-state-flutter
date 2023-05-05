import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../application/routers_app.dart';
import '../../../infrastructure/services/api_service.dart';

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
      (success) => Get.offNamed(RoutesApp.home),
    );
    isLoading.value = false;
  }

  void onPressedLogin() {
    if (formKey.currentState!.validate()) _signinProcess();
  }

  void onTabToRegister() => Get.toNamed(RoutesApp.register);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
