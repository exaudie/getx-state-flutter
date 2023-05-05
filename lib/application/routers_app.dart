import 'package:get/get.dart';

import '../ui/view/home/home_controller.dart';
import '../ui/view/home/home_view.dart';
import '../ui/view/login/login_controller.dart';
import '../ui/view/login/login_view.dart';
import '../ui/view/register/register_controller.dart';
import '../ui/view/register/register_view.dart';

class RoutesApp {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static List<GetPage> getPage = [
    GetPage(
      name: login,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
    GetPage(
      name: register,
      page: () => const RegisterView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RegisterController>(() => RegisterController());
      }),
    ),
    GetPage(
      name: home,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    )
  ];
}
