import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/common/index.dart' show AppColors, AppTextStyles;
import 'package:laza/core/index.dart' show NavItem;

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final void Function(NavItem index) onTap;
  final int currentIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 40),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -4),
            blurRadius: 20,
            color: AppColors.carbonBlack.withValues(alpha: 0.08),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...NavItem.values.map((item) {
            return GestureDetector(
              onTap: () => widget.onTap.call(item),
              child: item.index == widget.currentIndex
                  ? Text(
                      item.label,
                      style: AppTextStyles.s11W500.copyWith(
                        color: AppColors.softPeriWinkle,
                      ),
                    )
                  : SvgPicture.asset(
                      item.iconPath,
                      colorFilter: ColorFilter.mode(
                        AppColors.coolSteel,
                        BlendMode.srcIn,
                      ),
                    ),
            );
          }),
        ],
      ),
    );
  }
}
