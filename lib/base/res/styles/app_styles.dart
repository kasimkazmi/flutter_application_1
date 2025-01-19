import 'package:flutter/material.dart';

Color primary = const Color(0xFF687daf);

class AppStyles {
  static Color primaryColor = primary;
  static Color bgColor = const Color(0xFFeeedf2);
  static Color textColor = const Color(0xFF3b3b3b);
  static Color ticketTopColor = const Color(0xff526799);
  static Color ticketBottomColor = const Color(0xFFF37B67);
  static Color hotelKhakiColor = const Color(0xFFd2bdb6);
  static Color circleColor = const Color(0xff189999);
  static Color ticketBGColor = const Color(0xffffffff);
  static Color bigDotColor = const Color(0xFF8ACCF7);
  static Color planIconColor = const Color(0xFFBACCF7);
  static Color profileLocationBG = const Color(0xFFFEF4F3);
  static Color profileStatusTextColor = const Color(0xFF526799);
  static Color tapBarBgColor = const Color(0xFFF4F6FD);

  static const Color selectedTabColor = Color(0xFF4CAF50);

  static TextStyle textStyle = TextStyle(
      fontSize: 16, color: AppStyles.bgColor, fontWeight: FontWeight.w500);

  static TextStyle greetingsLabel =
      TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: textColor);

  static TextStyle greyHeadlineLabel = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey.shade500);

  static TextStyle headLineStyle2 = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
  );

  static TextStyle sectionHeadingLeft = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static TextStyle sectionHeadingRight = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
