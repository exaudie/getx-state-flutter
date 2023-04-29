import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../infrastructure/helpers/app_colors.dart';
import '../../../infrastructure/helpers/app_text_style.dart';
import '../../../infrastructure/helpers/app_view.dart';
import '../../../infrastructure/helpers/validation_field.dart';
import '../../shared/icon_button_app.dart';
import '../../shared/text_field_app.dart';
import 'login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.bgLogin,
      body: SingleChildScrollView(
        key: const Key('scroll.login'),
        child: Column(
          children: [
            AppView.verticalSpace(50),
            SvgPicture.asset(
              'assets/images/illustration_login.svg',
              height: 150,
              width: 150,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(28),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _headerPage(),
                  AppView.verticalSpace(24),
                  _loginAccountExisting(),
                  AppView.verticalSpace(18),
                  _lineOr(),
                  AppView.verticalSpace(18),
                  _contentLogin(context, controller),
                  _notHaveAccount(controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerPage() => Column(
        children: [
          Text(
            'Welcome to',
            style: AppTextStyle.poppinsFS20SemiBold.copyWith(
              color: AppColors.blackApp,
            ),
          ),
          Text(
            'Joy Games',
            style: AppTextStyle.poppinsFS24Bold.copyWith(
              color: AppColors.purplePrimary,
            ),
          ),
        ],
      );

  Widget _loginAccountExisting() => Column(
        children: [
          IconButtonApp(
            title: 'Login with Google',
            icon: 'assets/images/ic_google.svg',
            onPressed: () {},
          ),
          AppView.verticalSpace(16),
          IconButtonApp(
            title: 'Login with Facebook',
            icon: 'assets/images/ic_facebook.svg',
            onPressed: () {},
          ),
        ],
      );

  Widget _lineOr() => Row(
        children: [
          const Expanded(
            child: Divider(
              color: AppColors.line1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('OR', style: AppTextStyle.poppinsFS16Regular.copyWith(color: AppColors.blackApp)),
          ),
          const Expanded(
            child: Divider(
              color: AppColors.line1,
            ),
          ),
        ],
      );

  Widget _forgetPassword() => Row(
        children: [
          SizedBox(
            width: 12,
            height: 12,
            child: Checkbox(
              value: false,
              onChanged: (value) {},
            ),
          ),
          AppView.horizontalSpace(8),
          Text(
            'Remember me',
            style: AppTextStyle.poppinsFS12Regular.copyWith(
              color: AppColors.blackApp,
            ),
          ),
          const Spacer(),
          Text(
            'Forgot Password?',
            style: AppTextStyle.poppinsFS12Regular.copyWith(
              color: AppColors.purplePrimary,
            ),
          ),
        ],
      );

  Widget _contentLogin(BuildContext context, LoginController controller) => Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFieldApp(
              key: const Key('field.email'),
              controller: controller.emailController,
              labelText: 'Email',
              prefixIcon: Icons.mail,
              validator: (value) => ValidateField.required(value, 'email'),
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
            AppView.verticalSpace(20),
            _forgetPassword(),
            AppView.verticalSpace(14),
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
                          onPressed: controller.onPressedLogin,
                          child: const Text('Login'),
                        ),
                )),
          ],
        ),
      );

  Widget _notHaveAccount(LoginController controller) => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don’t have an account? ',
              style: AppTextStyle.poppinsFS12Regular.copyWith(
                color: AppColors.blackApp,
              ),
            ),
            GestureDetector(
              key: const Key('btntxt.register'),
              onTap: controller.onTabToRegister,
              child: Text(
                'Register',
                style: AppTextStyle.poppinsFS12Regular.copyWith(
                  color: AppColors.purplePrimary,
                ),
              ),
            ),
          ],
        ),
      );
}
