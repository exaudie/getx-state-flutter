import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'widget/widget_section.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: Obx(() => (controller.isLoading.value)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  key: const Key('main.scroll'),
                  children: const [
                    LandingSection(),
                    IntroSection(),
                    UpcomingSection(),
                    GameListSection(),
                    NewsSection(),
                    InvestorsSection(),
                    FooterSection(),
                  ],
                )),
        ),
      ),
    );
  }
}
