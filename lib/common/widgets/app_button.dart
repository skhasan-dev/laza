import 'package:flutter/material.dart';
import 'package:laza/common/index.dart' show AppColors, AppTextStyles;

class AppButton extends StatelessWidget {
  const AppButton({
    this.label,
    this.child,
    this.onPressed,
    this.isLoading = false,
    super.key,
  });

  final String? label;
  final bool isLoading;
  final Widget? child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        color: isLoading ? AppColors.platinum : AppColors.softPeriWinkle,
        padding: EdgeInsets.only(top: 14, bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? SizedBox(
                    height: 26,
                    width: 26,
                    child: CircularProgressIndicator(
                      color: AppColors.softPeriWinkle,
                      strokeWidth: 3,
                    ),
                  )
                : child ??
                      Text(
                        label ?? 'Click Me!!',
                        style: AppTextStyles.s17W500.copyWith(
                          color: Colors.white,
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
