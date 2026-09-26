import 'package:flutter/material.dart';
import 'package:laza/common/index.dart' show AppColors, AppTextStyles;

class AppButton extends StatelessWidget {
  const AppButton({this.label, this.child, this.onPressed, super.key});

  final String? label;
  final Widget? child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: AppColors.softPeriWinkle,
        padding: EdgeInsets.only(top: 14, bottom: 40),
        child:
            child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label ?? 'Click Me!!',
                  style: AppTextStyles.s17W500.copyWith(color: Colors.white),
                ),
              ],
            ),
      ),
    );
  }
}
