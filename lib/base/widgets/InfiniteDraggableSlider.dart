import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/widgets/dragable_widget.dart';

/// A widget that provides an infinite draggable slider with 3D-like effects.
/// The slider allows dragging of cards with animations for scale, rotation, and position.
class InfiniteDraggableSlider extends StatefulWidget {
  const InfiniteDraggableSlider({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.initialIndex = 0,
  });

  /// Builds the content of each draggable item.
  final Widget Function(BuildContext context, int index) itemBuilder;

  /// Total number of items in the slider.
  final int itemCount;

  /// Initial index to start the slider.
  final int initialIndex;

  @override
  State<InfiniteDraggableSlider> createState() => _InfiniteDraggableSliderState();
}

class _InfiniteDraggableSliderState extends State<InfiniteDraggableSlider>
    with SingleTickerProviderStateMixin {
  /// Default rotation angle for the cards (in radians).
  final double defaultAngle18Degrees = pi * 0.1;

  late AnimationController controller;
  late int currentIndex;

  SlideDirection slideDirection = SlideDirection.left;

  /// Computes the offset for a card based on its stack position.
  Offset getOffset(int stackIndex) {
    return {
      0: Offset(lerpDouble(0, -70, controller.value)!, 30),
      1: Offset(lerpDouble(-70, 70, controller.value)!, 30),
      2: Offset(70, 30) * (1 - controller.value),
    }[stackIndex] ??
        Offset(
            MediaQuery.of(context).size.width *
                controller.value *
                (slideDirection == SlideDirection.left ? -1 : 1),
            0);
  }

  /// Computes the rotation angle for a card based on its stack position.
  double getAngle(int stackIndex) =>
      {
        0: lerpDouble(0, -defaultAngle18Degrees, controller.value),
        1: lerpDouble(-defaultAngle18Degrees, defaultAngle18Degrees, controller.value),
        2: lerpDouble(defaultAngle18Degrees, 0, controller.value),
      }[stackIndex] ??
          0.0;

  /// Computes the scale for a card based on its stack position.
  double getScale(int stackIndex) =>
      {
        0: lerpDouble(0.6, 0.9, controller.value),
        1: lerpDouble(0.9, 0.95, controller.value),
        2: lerpDouble(0.95, 1, controller.value),
      }[stackIndex] ??
          1.0;

  /// Handles the slide-out animation and updates the direction.
  void onSlideOut(SlideDirection direction) {
    slideDirection = direction;
    controller.forward();
  }

  /// Listener for the animation controller to reset and loop the slider.
  void animationListener() {
    if (controller.isCompleted) {
      setState(() {
        // Reset to 0 if we exceed the item count.
        if (widget.itemCount == ++currentIndex) {
          currentIndex = 0;
        }
      });
      controller.reset();
    }
  }

  @override
  void initState() {
    super.initState();

    currentIndex = widget.initialIndex;
    controller = AnimationController(vsync: this, duration: kThemeAnimationDuration)
      ..addListener(animationListener);
  }

  @override
  void dispose() {
    controller
      ..removeListener(animationListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Stack(
          children: List.generate(
            4, // We render 4 stack positions for a smooth transition effect.
                (stackIndex) {
              final modIndex = (currentIndex + 3 - stackIndex) % widget.itemCount;

              return Transform.translate(
                offset: getOffset(stackIndex),
                child: Transform.scale(
                  scale: getScale(stackIndex),
                  child: Transform.rotate(
                    angle: getAngle(stackIndex),
                    child: DraggableWidget(
                      onSlideOut: onSlideOut,
                      isEnableDrag: stackIndex == 3, // Only the topmost card is draggable.
                      child: widget.itemBuilder(context, modIndex),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
