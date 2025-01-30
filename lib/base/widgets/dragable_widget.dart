import 'dart:math';

import 'package:flutter/material.dart';

/// Enum to represent the slide direction of the draggable widget.
enum SlideDirection { left, right }

/// A widget that allows dragging with smooth animations and slide-out detection.
class DraggableWidget extends StatefulWidget {
  const DraggableWidget({
    super.key,
    required this.child,
    this.onSlideOut,
    this.onPressed,
    required this.isEnableDrag,
  });

  /// The child widget to display within the draggable widget.
  final Widget child;

  /// Callback triggered when the widget is dragged out in a specific direction.
  final ValueChanged<SlideDirection>? onSlideOut;

  /// Callback triggered when the widget is tapped.
  final VoidCallback? onPressed;

  /// Flag to enable or disable dragging functionality.
  final bool isEnableDrag;

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController restoreController;
  late Size screenSize;

  final GlobalKey _widgetKey = GlobalKey();
  Offset startOffset = Offset.zero;
  Offset panOffset = Offset.zero;

  Size size = Size.zero;
  double angle = 0;

  /// Tracks if the widget was slid out of bounds.
  bool itWasMadeSlide = false;

  /// Threshold for determining if the widget is slid out.
  double get outSizeLimit => size.width * 0.65;

  /// Handles the start of a drag event.
  void onPanStart(DragStartDetails details) {
    if (!restoreController.isAnimating) {
      setState(() {
        startOffset = details.globalPosition;
      });
    }
  }

  /// Handles the update of a drag event.
  void onPanUpdate(DragUpdateDetails details) {
    if (!restoreController.isAnimating) {
      setState(() {
        panOffset = details.globalPosition - startOffset;
        angle = currentAngle;
      });
    }
  }

  /// Handles the end of a drag event.
  void onPanEnd(DragEndDetails details) {
    if (restoreController.isAnimating) {
      return;
    }

    final velocityX = details.velocity.pixelsPerSecond.dx;
    final positionX = currentPosition.dx;

    // Determine slide direction and trigger callback if needed.
    if (velocityX < -1000 || positionX < -outSizeLimit) {
      itWasMadeSlide = widget.onSlideOut != null;
      widget.onSlideOut?.call(SlideDirection.left);
    } else if (velocityX > 1000 || positionX > (screenSize.width - outSizeLimit)) {
      itWasMadeSlide = widget.onSlideOut != null;
      widget.onSlideOut?.call(SlideDirection.right);
    }

    restoreController.forward();
  }

  /// Listener to reset animation after restore.
  void restoreAnimationListener() {
    if (restoreController.isCompleted) {
      restoreController.reset();
      panOffset = Offset.zero;
      itWasMadeSlide = false;
      angle = 0;
      setState(() {});
    }
  }

  /// Gets the current position of the widget.
  Offset get currentPosition {
    final renderBox =
    _widgetKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
  }

  /// Calculates the current rotation angle based on drag position.
  double get currentAngle {
    return currentPosition.dx < 0
        ? (pi * 0.2) * currentPosition.dx / size.width
        : currentPosition.dx + size.width > screenSize.width
        ? (pi * 0.2) *
        (currentPosition.dx + size.width - screenSize.width) /
        size.width
        : 0;
  }

  /// Retrieves the size of the child widget.
  void getChildSize() {
    size =
        (_widgetKey.currentContext?.findRenderObject() as RenderBox?)?.size ??
            Size.zero;
  }

  @override
  void initState() {
    super.initState();

    restoreController =
    AnimationController(vsync: this, duration: kThemeAnimationDuration)
      ..addListener(restoreAnimationListener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenSize = MediaQuery.of(context).size;
      getChildSize();
    });
  }

  @override
  void dispose() {
    restoreController
      ..removeListener(restoreAnimationListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final child = SizedBox(key: _widgetKey, child: widget.child);

    if (!widget.isEnableDrag) return child;

    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: AnimatedBuilder(
        animation: restoreController,
        builder: (context, child) {
          final value = 1 - restoreController.value;
          return Transform.translate(
            offset: panOffset * value,
            child: Transform.rotate(
              angle: angle * (itWasMadeSlide ? 1 : value),
              child: child,
            ),
          );
        },
        child: child,
      ),
    );
  }
}
