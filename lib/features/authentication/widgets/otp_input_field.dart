import 'package:flutter/material.dart';
import 'package:laza/common/index.dart' show AppColors, AppTextStyles;

class OtpInputField extends StatelessWidget {
  const OtpInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 9,
      children: [
        for (int i = 0; i < 4; i++)
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 28),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.alabasterGrey),
              ),
              child: TextFormField(
                style: AppTextStyles.s22W500,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
      ],
    );
  }
}
