import 'package:flutter/material.dart';
import 'package:laza/common/index.dart' show AppTextStyles, AppColors;

class EmptyState extends StatelessWidget {
  const EmptyState({this.label, super.key});

  final String? label;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        top: MediaQuery.sizeOf(context).height * 0.35,
        bottom: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label ?? '-',
            style: AppTextStyles.s15W500.copyWith(color: AppColors.coolSteel),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
