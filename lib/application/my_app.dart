import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/application/routers_app.dart';

import '../ui/view/login/login_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX Demo',
      initialRoute: RoutesApp.login,
      getPages: RoutesApp.getPage,
      debugShowCheckedModeBanner: false,
    );
  }
}
