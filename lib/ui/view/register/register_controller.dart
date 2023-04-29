import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/services/api_service.dart';

class RegisterController extends GetxController {
  final _apiService = ApiService();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool obscureText = true.obs;
  RxBool isLoading = false.obs;

  void onPressedObscureText() => obscureText.value = !obscureText.value;

  void onTapToLogin() => Get.back();

  Future<void> _signupProses() async {
    isLoading.value = true;
    String name = nameController.text;
    String email = emailController.text;
    String mobilePhone = phoneController.text;
    String password = passwordController.text;

    Either<String, bool> results = await _apiService.postSignup(
      name: name,
      email: email,
      password: password,
      mobilePhone: mobilePhone,
    );

    results.fold(
      (errorMessage) => Get.snackbar('Error', errorMessage),
      (success) {
        Get.back();
        Get.snackbar('Success', "Registration is successful, please login");
      },
    );
    isLoading.value = false;
  }

  void onPressedRegister() {
    if (formKey.currentState!.validate()) _signupProses();
  }
}
