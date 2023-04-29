import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../infrastructure/helpers/app_colors.dart';
import '../../infrastructure/helpers/app_text_style.dart';
import '../../infrastructure/helpers/app_view.dart';

class IconButtonApp extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final double? elevation;
  final Color? shadowColor;
  final String icon;

  const IconButtonApp({
    Key? key,
    this.onPressed,
    required this.title,
    this.backgroundColor = Colors.white,
    required this.icon,
    this.textColor = AppColors.blackApp,
    this.elevation,
    this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppView.screenWidthFraction(context),
      height: 48,
      child: ElevatedButton.icon(
        icon: SizedBox(width: 20, height: 20, child: SvgPicture.asset(icon)),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        label: Text(
          title,
          style: AppTextStyle.poppinsFS16Regular.copyWith(color: textColor),
        ),
      ),
    );
  }
}
