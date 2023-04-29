import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../infrastructure/helpers/app_colors.dart';
import '../../../../infrastructure/helpers/app_text_style.dart';
import '../../../../infrastructure/helpers/app_view.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.blackApp,
        image: DecorationImage(image: AssetImage("assets/images/bg_news.png"), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          AppView.verticalSpace(25),
          SizedBox(
            width: double.infinity,
            height: 22.5,
            child: SvgPicture.asset(
              'assets/images/news.svg',
              fit: BoxFit.fitHeight,
            ),
          ),
          AppView.verticalSpace(16),
          Text(
            'Eclipse to the world of the end of our story Inside',
            style: AppTextStyle.montserratFS8Regular.copyWith(color: Colors.white),
          ),
          AppView.verticalSpace(30),
          _newsList(),
          AppView.verticalSpace(24),
          _buttonItem('VIEW ALL'),
          AppView.verticalSpace(24),
        ],
      ),
    );
  }

  Widget _newsList() {
    return Stack(
      children: [
        SizedBox(
          height: 110,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                height: 257.37,
                child: Image.asset(
                  'assets/images/news1.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              AppView.horizontalSpace(16),
              SizedBox(
                height: 257.37,
                child: Image.asset(
                  'assets/images/news2.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Row(
            children: [
              const Spacer(flex: 1),
              _buttonCircleItem(Icons.arrow_back_ios_new),
              const Spacer(flex: 4),
              _buttonCircleItem(Icons.arrow_forward_ios),
              const Spacer(flex: 1),
            ],
          ),
        )
      ],
    );
  }

  Widget _buttonItem(String text) => Container(
        margin: const EdgeInsets.symmetric(vertical: 9),
        alignment: Alignment.center,
        width: 86,
        height: 20,
        decoration: BoxDecoration(color: AppColors.iris100, borderRadius: BorderRadius.circular(10), boxShadow: const [
          BoxShadow(
            color: AppColors.irisShadow,
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ]),
        child: Text(
          text,
          style: AppTextStyle.montserratFS8Bold.copyWith(color: Colors.white),
        ),
      );

  Widget _buttonCircleItem(IconData icon) => Container(
        alignment: Alignment.center,
        width: 24,
        height: 24,
        decoration: BoxDecoration(color: AppColors.iris100, borderRadius: BorderRadius.circular(16), boxShadow: const [
          BoxShadow(
            color: AppColors.irisShadow,
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ]),
        child: Icon(
          icon,
          size: 18,
          color: Colors.white,
        ),
      );
}
