import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color; // Button background color
  final Color textColor; // Text color
  final double borderRadius; // Customizable corner radius

  const AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue, // Default background color
    this.textColor = Colors.white, // Default text color
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Replaces `primary`
        foregroundColor: textColor, // Replaces `onPrimary`
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
