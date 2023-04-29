import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/view/login/login_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter GetX Demo',
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
