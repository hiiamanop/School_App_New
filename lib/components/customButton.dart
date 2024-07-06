import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final double buttonWidth;
  final double buttonHeight;
  final double buttonMargin;
  final Widget child;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.buttonColor,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.buttonMargin,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(buttonMargin),
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.zero, // Remove default padding
        ),
        child: child, // Removed Center widget
      ),
    );
  }
}