import 'package:flutter/material.dart';
import '../../../base/res/styles/app_styles.dart';

class TopNavbar extends StatelessWidget {
  const TopNavbar({super.key, required this.tabs});
  final List<Map<String, dynamic>> tabs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      // color: AppStyles.primaryColor, // Background color of the container
      padding: const EdgeInsets.symmetric(horizontal: 12), // Optional padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly spaced items
        children: tabs.map((tab) {
          return Container(
            alignment: Alignment(45, 45),
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Prevents stretching the column
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color:
                        tab['backgroundColor'], // Background color for each tab
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    tab['icon'],
                    color: tab['iconColor'], // Icon color
                    size: 30,
                  ),
                ),
                const SizedBox(height: 8), // Space between icon and label
                Text(
                  tab['label'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
