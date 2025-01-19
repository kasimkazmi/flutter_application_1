
import 'package:flutter/material.dart';

import '../res/styles/app_styles.dart';

class BackgroundShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Top Curve (Orange to Red Gradient)
    final Paint topPaint = Paint()
      ..shader = LinearGradient(
        colors: [AppStyles.ticketBottomColor, Colors.orange], // Gradient colors
        begin: Alignment.topLeft, // Gradient starts at top-left
        end: Alignment.bottomRight, // Gradient ends at bottom-right
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final Path topPath = Path();
    topPath.moveTo(0, 0); // Start at top-left corner
    topPath.lineTo(size.width, 0); // Line to top-right corner
    topPath.lineTo(size.width, size.height * 0.02); // Move down slightly
    topPath.cubicTo(
      size.width * 0.65, // Control point 1
      size.height * 0.15,
      size.width * 0.15, // Control point 2
      size.height * 0,
      0, // End of the curve
      size.height * 0.25,
    );
    topPath.close(); // Close the path
    canvas.drawPath(topPath, topPaint); // Draw the path

    // Bottom Curve (Blue Gradient, starting from bottom-right)
    final Paint bottomPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          AppStyles.ticketTopColor,
          Colors.blueAccent
        ], // Gradient colors
        begin: Alignment.topRight, // Gradient starts at top-right
        end: Alignment.bottomLeft, // Gradient ends at bottom-left
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final Path bottomPath = Path();
    bottomPath.moveTo(size.width, size.height); // Start at bottom-right corner
    bottomPath.lineTo(0, size.height); // Line to bottom-left corner
    bottomPath.lineTo(0, size.height * 1.0); // Move upward slightly
    bottomPath.cubicTo(
      size.width * 0.10, // Control point 1
      size.height * 0.90,
      size.width * 1.65, // Control point 2
      size.height * 1.03,
      size.width, // End of the curve
      size.height * 0.06,
    );
    bottomPath.close(); // Close the path
    canvas.drawPath(bottomPath, bottomPaint); // Draw the path
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
