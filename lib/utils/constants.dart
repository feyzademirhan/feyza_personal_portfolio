import 'package:flutter/material.dart';

Color kPrimaryColor = const Color(0xFF3B3F59);
Color kBackgroundColor = const Color(0xFF0D0D0D);
Color kDangerColor = const Color(0xFFA6654E);
Color kCaptionColor = const Color(0xFFBFBBB0);

const double kDesktopMaxWidth = 1200.0;
const double kTabletMaxWidth = 800.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;