import 'package:flutter/material.dart';

class IncrementCounter extends StatelessWidget {
  final Color _borderColor = Colors.grey; // Set to transparent

  const IncrementCounter({
    super.key,
    required this.numberOfPassengers,
    required this.onChanged,
    this.iconSize = 24.0, // Default icon size
    this.iconColor = const Color(0xff526799),
    required this.leftIcon,
    required this.rightIcon,
    required this.middleIcon, // Default icon color
  });

  final int numberOfPassengers;
  final IconData leftIcon;
  final IconData rightIcon;
  final IconData middleIcon;
  final double iconSize;
  final Color iconColor;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align label to the start
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // Background color
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: _borderColor), // Border color )// Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1), // Shadow color
                offset: const Offset(0, 4), // Shadow offset
                blurRadius: 8, // Shadow blur radius
                spreadRadius: 2, // Shadow spread radius
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Space between buttons and text
            children: [
              IconButton(
                icon: Icon(leftIcon),
                color: iconColor, // Use the passed icon color
                onPressed: () {
                  if (numberOfPassengers > 1) {
                    onChanged(numberOfPassengers - 1); // Decrement passengers
                  }
                },
              ),
              Row(
                children: [
                  Icon(
                    middleIcon, // Use the middle icon to represent a passenger
                    size: iconSize, // Customize the size of the icon
                    color: iconColor, // Use the passed icon color
                  ),
                  SizedBox(width: 8), // Space between icon and text
                  Text(
                    '$numberOfPassengers', // Display the number of passengers
                    style: TextStyle(fontSize: 18), // Customize this style
                  ),
                ],
              ),
              IconButton(
                icon: Icon(rightIcon),
                color: iconColor, // Use the passed icon color
                onPressed: () {
                  onChanged(numberOfPassengers + 1); // Increment passengers
                },
              ),
            ],
          ), // Padding inside the container
        ),
      ],
    );
  }
}
