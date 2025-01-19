import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';

class ThreeTabBar extends StatelessWidget {
  const ThreeTabBar({
    super.key,
    required this.leftTab,
    required this.middleTab,
    required this.rightTab,
    required this.selectedTabIndex,
    required this.onTabSelected, // Callback to handle tab selection
  });

  final String leftTab;
  final String middleTab;
  final String rightTab;
  final int selectedTabIndex; // Track the selected tab index
  final ValueChanged<int> onTabSelected; // Callback type

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppStyles.tapBarBgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between tabs
        children: [
          AppTab(
            tabText: leftTab,
            isSelected: selectedTabIndex == 0, // Check if this tab is selected
            onTap: () => onTabSelected(0), // Call the callback with the index
          ),
          AppTab(
            tabText: middleTab,
            isSelected: selectedTabIndex == 1,
            onTap: () => onTabSelected(1),
          ),
          AppTab(
            tabText: rightTab,
            isSelected: selectedTabIndex == 2,
            onTap: () => onTabSelected(2),
          ),
        ],
      ),
    );
  }
}

class AppTab extends StatelessWidget {
  const AppTab({
    super.key,
    required this.tabText,
    this.isSelected = false,
    required this.onTap, // Add onTap callback
  });

  final String tabText;
  final bool isSelected;
  final VoidCallback onTap; // Callback type

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap, // Call the onTap callback when tapped
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            // color: isSelected ? AppStyles.selectedTabColor : Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              tabText,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: isSelected ? 16 : 14,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
