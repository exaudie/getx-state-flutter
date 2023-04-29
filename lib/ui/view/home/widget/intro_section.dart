import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../infrastructure/helpers/app_text_style.dart';
import '../../../../infrastructure/helpers/app_view.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppView.verticalSpace(31),
        SizedBox(
          width: 127,
          child: SvgPicture.asset('assets/images/joy_game.svg', fit: BoxFit.fill),
        ),
        AppView.verticalSpace(24),
        Text(
          'INTO THE METAVERSE',
          style: AppTextStyle.montserratFS20Bold.copyWith(color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 24),
          child: Text(
            'Earn, trade, stake, farm and swap your game assets the way you want. '
            'Welcome to a metaverse that lets you truly decide how you want to play. ',
            textAlign: TextAlign.justify,
            style: AppTextStyle.montserratFS16H26Regular.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(
            width: double.infinity,
            height: 254,
            child: SvgPicture.asset('assets/images/intro_image.svg', fit: BoxFit.fitWidth)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 24),
          child: Text(
            'This is for all the gamers out there no matter who you are, whether you\'re a newbie or a whale. It\'s '
            'time to game on your own terms. Welcome to Joy Games - Metaverse gaming by true game makers.',
            textAlign: TextAlign.justify,
            style: AppTextStyle.montserratFS16H26Regular.copyWith(color: Colors.white),
          ),
        )
      ],
    );
  }
}
