import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../infrastructure/helpers/app_text_style.dart';
import '../../../../infrastructure/helpers/app_view.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppView.verticalSpace(20),
        SizedBox(
          width: 127,
          child: SvgPicture.asset('assets/images/joy_game.svg', fit: BoxFit.fill),
        ),
        AppView.verticalSpace(28),
        Text(
          'METAVERSE GAMING',
          style: AppTextStyle.montserratFS13Bold.copyWith(color: Colors.white),
        ),
        Text('BY JOY GAME PLAYER', style: AppTextStyle.montserratFS12SemiBold.copyWith(color: Colors.white)),
        AppView.verticalSpace(28),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ourService(),
            _help(),
          ],
        ),
        AppView.verticalSpace(35),
        Text(
          'JOIN OUR COMMUNITY',
          style: AppTextStyle.montserratFS13Bold.copyWith(color: Colors.white),
        ),
        AppView.verticalSpace(32),
        _iconCommunity(),
        AppView.verticalSpace(18),
        Text(
          '© 2022 Joy Games',
          style: AppTextStyle.montserratFS13Regular.copyWith(color: Colors.white),
        ),
        AppView.verticalSpace(18),
        Text(
          'Terms & Conditions',
          style: AppTextStyle.montserratFS13Regular.copyWith(color: Colors.white),
        ),
        AppView.verticalSpace(18),
        Text(
          'Privacy Policy',
          style: AppTextStyle.montserratFS13Regular.copyWith(color: Colors.white),
        ),
        AppView.verticalSpace(44),
      ],
    );
  }

  Widget _iconCommunity() {
    List<String> iconList = [
      'ic_twitter.svg',
      'ic_medium.svg',
      'ic_discord.svg',
      'ic_telegram.svg',
      'ic_github.svg',
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.from(
        iconList.map(
          (e) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 23,
            height: 23,
            child: SvgPicture.asset('assets/images/$e', fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  Widget _ourService() {
    List<String> textList = [
      'OUR SERVICES',
      'ABOUT ',
      'STORE',
      'GAMEBOX',
      'TOKEN',
      'STACKING',
      'DOCS',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.from(
        textList.asMap().entries.map(
              (e) => Padding(
                padding: EdgeInsets.only(bottom: ((e.key == 0) ? 30 : 20)),
                child: Text(
                  e.value,
                  style: ((e.key == 0) ? AppTextStyle.montserratFS12Bold : AppTextStyle.montserratFS12Regular)
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
      ),
    );
  }

  Widget _help() {
    List<String> textList = [
      'HELP',
      'HELP',
      'FAQs',
      'CONTACT',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.from(
        textList.asMap().entries.map(
              (e) => Padding(
                padding: EdgeInsets.only(bottom: ((e.key == 0) ? 30 : 20)),
                child: Text(
                  e.value,
                  style: ((e.key == 0) ? AppTextStyle.montserratFS12Bold : AppTextStyle.montserratFS12Regular)
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
      ),
    );
  }
}
