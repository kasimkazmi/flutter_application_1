import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';

import '../../../base/utils/values/values.dart';

class CardTags extends StatelessWidget {
  final String title;
  final BoxDecoration decoration;

  const CardTags({
    super.key,
    required this.title,
    this.decoration = Decorations.regularDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Container(
        width: 40,
        // color: AppStyles.ticketTopColor,
        height: 14,
        decoration: decoration,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Styles.customNormalTextStyle(
              fontSize: Sizes.TEXT_SIZE_10,
            ),
          ),
        ),
      ),
    );
  }
}
