import 'dart:math';

import 'package:flutter/material.dart';

class ViewsApp {
  static MediaQueryData screenQuery(BuildContext context) => MediaQuery.of(context);

  static Widget verticalSpace(double height) => SizedBox(height: height);

  static Widget horizontalSpace(double width) => SizedBox(width: width);

  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  static double screenHeightFraction(BuildContext context,
          {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
      min((screenHeight(context) - offsetBy) / dividedBy, max);

  static double screenWidthFraction(BuildContext context,
          {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
      min((screenWidth(context) - offsetBy) / dividedBy, max);
}
