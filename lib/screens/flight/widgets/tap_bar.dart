import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';

class TapBar extends StatelessWidget {
  const TapBar({super.key, required this.leftTab, required this.rightTab});
  final String leftTab;
  final String rightTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppStyles.tapBarBgColor),
      child: Row(
        children: [
          AppTabs(
            tabText: leftTab,
          ),
          AppTabs(
            tabText: rightTab,
            tabColor: true,
            tabBorder: true,
          ),
        ],
      ),
    );
  }
}

class AppTabs extends StatelessWidget {
  const AppTabs(
      {super.key,
      this.tabText = "",
      this.tabBorder = false,
      this.tabColor = false});
  final String tabText;
  final bool tabBorder;
  final bool tabColor;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: size.width * .44,
        decoration: BoxDecoration(
            color: tabColor == false ? Colors.white : Colors.transparent,
            borderRadius: tabBorder == false
                ? const BorderRadius.horizontal(left: Radius.circular(50))
                : const BorderRadius.horizontal(right: Radius.circular(50))),
        child: Center(child: Text(tabText)));
  }
}
