import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza/common/theme/index.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    this.isLoading = false,
    super.key,
  });

  final String icon;
  final String label;
  final bool isLoading;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              SizedBox(
                height: 26,
                width: 26,
                child: CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 3,
                ),
              )
            else ...[
              SvgPicture.asset(icon),
              Text(
                label,
                style: AppTextStyles.s17W600.copyWith(
                  color: Colors.white,
                  letterSpacing: -0.41,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
