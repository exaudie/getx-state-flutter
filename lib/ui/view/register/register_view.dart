import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../infrastructure/helpers/app_colors.dart';
import '../../../infrastructure/helpers/app_text_style.dart';
import '../../../infrastructure/helpers/app_view.dart';
import '../../../infrastructure/helpers/validation_field.dart';
import '../../shared/text_field_app.dart';
import 'register_controller.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Scaffold(
      backgroundColor: AppColors.bgLogin,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppView.verticalSpace(50),
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
                      style: AppTextStyle.poppinsFS20SemiBold.copyWith(
                        color: AppColors.blackApp,
                      ),
                    ),
                    AppView.verticalSpace(24),
                    TextFieldApp(
                      key: const Key('field.name'),
                      controller: controller.nameController,
                      labelText: 'Name',
                      prefixIcon: Icons.person,
                      validator: (value) => ValidateField.required(value, 'name'),
                    ),
                    AppView.verticalSpace(16),
                    TextFieldApp(
                      controller: controller.emailController,
                      key: const Key('field.email'),
                      labelText: 'Email',
                      prefixIcon: Icons.mail,
                      validator: (value) => ValidateField.required(value, 'email'),
                    ),
                    AppView.verticalSpace(16),
                    TextFieldApp(
                      key: const Key('field.phone'),
                      controller: controller.phoneController,
                      labelText: 'Phone',
                      prefixIcon: Icons.phone_android,
                      validator: (value) => ValidateField.required(value, 'phone'),
                    ),
                    AppView.verticalSpace(16),
                    Obx(() => TextFieldApp(
                          key: const Key('field.pass'),
                          controller: controller.passwordController,
                          obscureText: controller.obscureText.value,
                          suffix: (controller.obscureText.value) ? Icons.visibility : Icons.visibility_off,
                          onTabSuffix: controller.onPressedObscureText,
                          labelText: 'Password',
                          prefixIcon: Icons.key,
                          validator: (value) => ValidateField.required(value, 'password'),
                        )),
                    AppView.verticalSpace(24),
                    Obx(() => SizedBox(
                          width: AppView.screenWidthFraction(context),
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
              style: AppTextStyle.poppinsFS12Regular.copyWith(
                color: AppColors.blackApp,
              ),
            ),
            GestureDetector(
              onTap: controller.onTapToLogin,
              child: Text(
                'Login',
                style: AppTextStyle.poppinsFS12Regular.copyWith(
                  color: AppColors.purplePrimary,
                ),
              ),
            ),
          ],
        ),
      );
}
