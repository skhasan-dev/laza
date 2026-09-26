import 'package:flutter/material.dart';

class GenderPreferenceCard extends StatelessWidget {
  const GenderPreferenceCard({
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    super.key,
  });

  final Widget label;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor,
          ),
          child: Center(child: label),
        ),
      ),
    );
  }
}
