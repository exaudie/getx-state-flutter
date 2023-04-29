import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingSection extends StatelessWidget {
  const LandingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/landing_image.png',
              width: double.infinity,
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  width: double.infinity,
                  height: 41,
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
            _landingHeader(),
          ],
        ),
        _ladingBottom(),
      ],
    );
  }

  Widget _landingHeader() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: SizedBox(
                width: 59,
                height: 29,
                child: SvgPicture.asset('assets/images/joy_game.svg', fit: BoxFit.fill),
              ),
            ),
            SvgPicture.asset('assets/images/ic_menu.svg'),
          ],
        ),
      );

  Widget _ladingBottom() => Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 62,
            child: SvgPicture.asset(
              'assets/images/bg_landing_bottom.svg',
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/icandy.png',width: 60,),
                Image.asset('assets/images/lemon_sky.png',width: 60,),
                Image.asset('assets/images/jeric_verse.png',width: 60,),
                Image.asset('assets/images/game_economy.png',width: 60,),
              ],
            ),
          )
        ],
      );
}
