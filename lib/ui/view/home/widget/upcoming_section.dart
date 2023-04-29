import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../infrastructure/helpers/app_colors.dart';
import '../../../../infrastructure/helpers/app_text_style.dart';
import '../../../../infrastructure/helpers/app_view.dart';

class UpcomingSection extends StatelessWidget {
  const UpcomingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 46),
      color: AppColors.bgUpcoming,
      child: Column(children: [
        SizedBox(
          width: double.infinity,
          height: 28,
          child: SvgPicture.asset(
            'assets/images/upcoming_games.svg',
            fit: BoxFit.fitHeight,
          ),
        ),
        AppView.verticalSpace(16),
        Text(
          'Joy Games aims to not just create a platform but also will play an active role in the development '
          'and curation of gaming content on the platform, the upkeep of the codebase, '
          'and the development of new exciting ways to implement gamified finance into existing or new games, '
          'via a mixture of of inhouse development or co-development with our strategic partners, '
          'who are experienced and successful game development studios.',
          textAlign: TextAlign.center,
          style: AppTextStyle.montserratFS15Regular.copyWith(color: Colors.white),
        ),
        AppView.verticalSpace(27),
        _buttonUpcoming(),
        AppView.verticalSpace(22),
      ]),
    );
  }

  Widget _buttonUpcoming() {
    List<String> buttonList = [
      'Adventure',
      'Arcade',
      'Race',
      'Open World',
      'RPG',
      'MMORPG',
      'FPS',
      'Multiplayer',
    ];

    return Column(
      children: List.from(buttonList.map((e) => _buttonItem(e))),
    );
  }

  Widget _buttonItem(String text) => Container(
        margin: const EdgeInsets.symmetric(vertical: 9),
        alignment: Alignment.center,
        width: 186,
        height: 44,
        decoration: BoxDecoration(color: AppColors.iris100, borderRadius: BorderRadius.circular(30), boxShadow: const [
          BoxShadow(
            color: AppColors.irisShadow,
            blurRadius: 4,
            spreadRadius: 4,
          )
        ]),
        child: Text(
          text,
          style: AppTextStyle.montserratFS22Bold.copyWith(color: Colors.white),
        ),
      );
}
