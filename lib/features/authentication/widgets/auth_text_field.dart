import 'package:flutter/material.dart';
import 'package:laza/common/index.dart' show AppTextStyles, AppColors;

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    required this.controller,
    required this.title,
    required this.subtitle,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.suffixIcon,
    super.key,
  });

  final TextEditingController controller;
  final String title;
  final String subtitle;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onChanged;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTextStyles.s13W400.copyWith(color: AppColors.coolSteel),
        ),
        TextFormField(
          controller: widget.controller,
          style: AppTextStyles.s15W500.copyWith(color: AppColors.carbonBlack),
          validator: widget.validator,
          onChanged: widget.onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          decoration: InputDecoration(
            hint: Text(
              widget.subtitle,
              style: AppTextStyles.s13W400.copyWith(color: AppColors.coolSteel),
            ),
            suffix: widget.suffixIcon,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.alabasterGrey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.alabasterGrey),
            ),
          ),
        ),
      ],
    );
  }
}
