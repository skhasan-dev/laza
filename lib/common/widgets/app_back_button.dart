import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart' show AppColors;
import 'package:laza/gen/assets.gen.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    this.onPressed,
    this.backgroundColor = AppColors.platinum,
    super.key,
  });

  final VoidCallback? onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? context.pop,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: SvgPicture.asset(Assets.icons.arrowLeft.path),
      ),
    );
  }
}
