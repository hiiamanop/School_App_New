import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Color containerColor;
  final double containerWidth;
  final double containerHeight;
  final double containerMargin;
  final Widget child; // Generic child widget

  const CustomContainer({
    super.key,
    required this.containerColor,
    required this.containerWidth,
    required this.containerHeight,
    required this.containerMargin,
    required this.child, // Accept any widget as child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(containerMargin),
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: containerColor, // Use the passed containerColor
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(child: child), // Use the passed child widget
    );
  }
}
