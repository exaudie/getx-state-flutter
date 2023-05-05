import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructure/enums/game_type.dart';
import '../../../../infrastructure/helpers/text_styles_app.dart';
import '../../../../infrastructure/helpers/views_app.dart';
import '../home_controller.dart';

class GameListSection extends StatelessWidget {
  const GameListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Obx(() => Column(
          children: List.from(
            controller.gameList.map(
              (e) => (e.type == GameType.text)
                  ? _textItem(image: e.image ?? '', title: e.title ?? '', subtitle: e.subtitle ?? '')
                  : _imageItem(image: e.image ?? '', title: e.title ?? ''),
            ),
          ),
        ));
  }

  Widget _textItem({required String image, required String title, required String subtitle}) {
    return Container(
      width: double.infinity,
      height: 417,
      padding: const EdgeInsets.only(top: 52, right: 16, bottom: 16, left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyleApp.montserratFS22Bold.copyWith(color: Colors.white),
          ),
          ViewsApp.verticalSpace(12),
          Text(
            subtitle,
            style: TextStyleApp.montserratFS18Regular.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _imageItem({required String image, required String title}) {
    return Container(
      width: double.infinity,
      height: 417,
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: double.infinity,
            height: 88,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            color: Colors.black.withOpacity(0.2),
            child: Text(
              title,
              style: TextStyleApp.montserratFS22Bold.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
