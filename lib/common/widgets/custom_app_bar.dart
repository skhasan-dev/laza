import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza/common/index.dart';
import 'package:laza/gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.leading,
    this.title,
    this.hideCart = false,
    this.backgroundColor = AppColors.white,
    super.key,
  });

  final Widget? leading;
  final Widget? title;
  final bool hideCart;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(color: backgroundColor),
        child: Row(
          children: [
            leading ?? AppBackButton(),
            Spacer(),
            Expanded(child: title ?? SizedBox.shrink()),
            Spacer(),
            if (!hideCart)
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.platinum,
                ),
                child: SvgPicture.asset(
                  Assets.icons.bag.path,
                  height: 25,
                  width: 25,
                ),
              )
            else
              SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
