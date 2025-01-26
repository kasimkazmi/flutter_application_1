import 'package:flutter/material.dart';

class TopNavbar extends StatelessWidget {
  const TopNavbar({super.key, required this.tabs, required this.onTabSelected});

  final List<Map<String, dynamic>> tabs;
  final Function(int) onTabSelected; // Callback to handle tab selection

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12), // Optional padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly spaced items
        children: tabs.asMap().entries.map((entry) {
          int index = entry.key; // Get the index of the tab
          Map<String, dynamic> tab = entry.value; // Get the tab data

          return GestureDetector(
            // Wrap the tab in a GestureDetector
            onTap: () =>
                onTabSelected(index), // Call the callback with the index
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Prevents stretching the column
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: tab[
                          'backgroundColor'], // Background color for each tab
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
            ),
          );
        }).toList(),
      ),
    );
  }
}
