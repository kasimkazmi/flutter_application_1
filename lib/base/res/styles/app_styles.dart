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

  static const Gradient italianGradient = LinearGradient(
    colors: [
      Color(0xFFFF5673),
      Color(0xFFFF8C48),
    ],
  );
  static const Gradient chineseGradient = LinearGradient(
    colors: [
      Color(0xFFFF4665),
      Color(0xFF832BF6),
    ],
  );
  static const Gradient mexicanGradient = LinearGradient(
    colors: [
      Color(0xFF3B40FE),
      Color(0xFF2DCEF8),
    ],
  );
  static const Gradient thaiGradient = LinearGradient(
    colors: [
      Color(0xFF009DC5),
      Color(0xFF21E590),
    ],
  );
  static const Gradient arabianGradient = LinearGradient(
    colors: [
      Color(0xFFFF870E),
      Color(0xFFD236D2),
    ],
  );
  static const Gradient indianGradient = LinearGradient(
    colors: [
      Color(0xFF5C51FF),
      Color(0xFFFE327E),
    ],
  );
  static const Gradient americanGradient = LinearGradient(
    colors: [
      Color(0xFF2CE3F1),
      Color(0xFF6143FF),
    ],
  );
  static const Gradient koreanGradient = LinearGradient(
    colors: [
      Color(0xFFFF8C48),
      Color(0xFFFF5673),
    ],
  );









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
