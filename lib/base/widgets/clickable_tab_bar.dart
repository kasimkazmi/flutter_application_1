import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';

class ClickableTabBar extends StatelessWidget {
  const ClickableTabBar(
      {super.key,
      required this.tabNames,
      required this.selectedTabIndex,
      required this.onTabSelected});
  final List<String> tabNames;
  final int selectedTabIndex;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppStyles.tapBarBgColor),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
        child: Row(
          children: List.generate(tabNames.length, (index) {
            return AppTab(
              tabText: tabNames[index],
              isSelected: selectedTabIndex == index,
              onTap: () => onTabSelected(index),
            );
          }),
        ),
      ),
    );
  }
}

class AppTab extends StatelessWidget {
  const AppTab({
    super.key,
    required this.tabText,
    this.isSelected = false,
    required this.onTap,
  });

  final String tabText;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 8.0), // Add padding between tabs
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          // Change to Column to stack the text and dot
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10, horizontal: 20), // Add horizontal padding
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  tabText,
                  style: TextStyle(
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: isSelected ? 16 : 14,
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
            // Dot indicator
            isSelected
                ? Container(
                    margin: const EdgeInsets.only(
                        top: 0, bottom: 10), // Space between text and dot
                    height: 6, // Height of the dot
                    width: 6, // Width of the dot
                    decoration: BoxDecoration(
                      color: Colors.black, // Color of the dot
                      shape: BoxShape.circle, // Make it circular
                    ),
                  )
                : SizedBox.shrink(), // No dot when not selected
          ],
        ),
      ),
    );
  }
}
