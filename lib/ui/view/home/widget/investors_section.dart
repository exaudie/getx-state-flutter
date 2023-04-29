import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../infrastructure/helpers/app_colors.dart';
import '../../../../infrastructure/helpers/app_view.dart';

class InvestorsSection extends StatelessWidget {
  const InvestorsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgUpcoming,
      child: Column(
        children: [
          AppView.verticalSpace(21),
          SizedBox(
              width: double.infinity,
              height: 22.5,
              child: SvgPicture.asset(
                'assets/images/stategig_investor.svg',
                fit: BoxFit.fitHeight,
              )),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: List.generate(
              16,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  height: 20,
                  'assets/images/ivestor${index + 1}.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          AppView.verticalSpace(22),
        ],
      ),
    );
  }
}
