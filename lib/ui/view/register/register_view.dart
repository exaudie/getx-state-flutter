import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../infrastructure/helpers/colors_app.dart';
import '../../../infrastructure/helpers/text_styles_app.dart';
import '../../../infrastructure/helpers/views_app.dart';
import '../../../infrastructure/helpers/validations_field.dart';
import '../../shared/text_field_app.dart';
import 'register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLogin,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ViewsApp.verticalSpace(50),
            SvgPicture.asset(
              'assets/images/illustration_login.svg',
              height: 100,
              width: 100,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(28),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Text(
                      key: const Key('title.register'),
                      'Register',
                      style: TextStyleApp.poppinsFS20SemiBold.copyWith(
                        color: AppColors.blackApp,
                      ),
                    ),
                    ViewsApp.verticalSpace(24),
                    TextFieldApp(
                      key: const Key('field.name'),
                      controller: controller.nameController,
                      labelText: 'Name',
                      prefixIcon: Icons.person,
                      validator: (value) => ValidationsField.required(value, 'name'),
                    ),
                    ViewsApp.verticalSpace(16),
                    TextFieldApp(
                      controller: controller.emailController,
                      key: const Key('field.email'),
                      labelText: 'Email',
                      prefixIcon: Icons.mail,
                      validator: (value) => ValidationsField.required(value, 'email'),
                    ),
                    ViewsApp.verticalSpace(16),
                    TextFieldApp(
                      key: const Key('field.phone'),
                      controller: controller.phoneController,
                      labelText: 'Phone',
                      prefixIcon: Icons.phone_android,
                      validator: (value) => ValidationsField.required(value, 'phone'),
                    ),
                    ViewsApp.verticalSpace(16),
                    Obx(() => TextFieldApp(
                          key: const Key('field.pass'),
                          controller: controller.passwordController,
                          obscureText: controller.obscureText.value,
                          suffix: (controller.obscureText.value) ? Icons.visibility : Icons.visibility_off,
                          onTabSuffix: controller.onPressedObscureText,
                          labelText: 'Password',
                          prefixIcon: Icons.key,
                          validator: (value) => ValidationsField.required(value, 'password'),
                        )),
                    ViewsApp.verticalSpace(24),
                    Obx(() => SizedBox(
                          width: ViewsApp.screenWidthFraction(context),
                          height: 48,
                          child: (controller.isLoading.value)
                              ? const Center(child: CircularProgressIndicator())
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.purplePrimary,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                                      elevation: 0),
                                  onPressed: controller.onPressedRegister,
                                  child: const Text('Register'),
                                ),
                        )),
                    _alreadyRegistered(controller),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _alreadyRegistered(RegisterController controller) => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already registered? ',
              style: TextStyleApp.poppinsFS12Regular.copyWith(
                color: AppColors.blackApp,
              ),
            ),
            GestureDetector(
              onTap: controller.onTapToLogin,
              child: Text(
                'Login',
                style: TextStyleApp.poppinsFS12Regular.copyWith(
                  color: AppColors.purplePrimary,
                ),
              ),
            ),
          ],
        ),
      );
}
