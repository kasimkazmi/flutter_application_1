import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';

class CustomFloatingActionButton extends StatefulWidget {
  final AnimationController animationController;
  final VoidCallback onPressed; // Use VoidCallback for the onPressed type
  final Widget child; // Accept any widget as the child (e.g., Icon, Text, etc.)

  const CustomFloatingActionButton({
    super.key,
    required this.animationController,
    required this.onPressed,
    required this.child, // Add the child widget as a required parameter
  });

  @override
  _CustomFloatingActionButtonState createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  late Animation<double> _addAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation
    _addAnimation = CurvedAnimation(
      parent: widget.animationController,
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Toggle the animation
        if (widget.animationController.isCompleted) {
          widget.animationController.reverse();
        } else {
          widget.animationController.forward();
        }
        // Call the custom onPressed action passed from parent
        widget.onPressed();
      },
      backgroundColor:
          AppStyles.ticketBottomColor, // Background color of the button
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(60), // Custom shape with rounded corners
      ),
      elevation: 5,
      // Adds a shadow to the button
      splashColor: Colors.white, // Splash color when the button is pressed
      // child: AnimatedIcon(
      //   icon: AnimatedIcons.add_event,
      //   color: AppStyles.ticketTopColor,
      //   progress: _addAnimation, // Pass the animation here
      // ),
      child: widget.child, // Use the passed child widget (e.g., Icon)
    );
  }
}
