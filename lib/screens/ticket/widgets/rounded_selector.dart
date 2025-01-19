import 'package:flutter/material.dart';

import '../../../base/res/styles/app_styles.dart';

class RoundedSelector extends StatelessWidget {
  final bool? position;
  const RoundedSelector({super.key, this.position});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position == true ? 22 : null,
        right: position == true ? null : 22,
        top: 262,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color: AppStyles.textColor,
            ),
          ),
          child: CircleAvatar(
            maxRadius: 4,
            backgroundColor: AppStyles.textColor,
          ),
        ));
  }
}
