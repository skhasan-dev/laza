import 'package:flutter/material.dart';
import 'package:laza/common/index.dart' show AppTextStyles, AppColors;

class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.controller,
    required this.subtitle,
    this.title,
    this.validator,
    this.keyboardType = TextInputType.text,

    this.prefixIcon,
    this.prefixIconConstraints,
    this.prefixIconSpacing = 10,
    this.maxLines = 1,
    super.key,
  });

  final TextEditingController controller;
  final String? title;
  final String subtitle;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final double prefixIconSpacing;
  final int maxLines;
  final String? Function(String? value)? validator;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null && widget.title!.isNotEmpty)
          Text(
            widget.title ?? '-',
            style: AppTextStyles.s17W500.copyWith(color: AppColors.carbonBlack),
          ),
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.platinum,
          ),
          child: TextFormField(
            controller: widget.controller,
            style: AppTextStyles.s15W500.copyWith(color: AppColors.carbonBlack),
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.platinum,
              prefixIcon: widget.prefixIcon == null
                  ? null
                  : Padding(
                      padding: EdgeInsets.only(right: widget.prefixIconSpacing),
                      child: widget.prefixIcon,
                    ),
              isDense: true,
              isCollapsed: true,
              prefixIconConstraints: widget.prefixIconConstraints,
              hint: Text(
                widget.subtitle,
                style: AppTextStyles.s15W400.copyWith(
                  color: AppColors.coolSteel,
                ),
              ),
              border: InputBorder.none,
            ),
            maxLines: widget.maxLines,
          ),
        ),
      ],
    );
  }
}
