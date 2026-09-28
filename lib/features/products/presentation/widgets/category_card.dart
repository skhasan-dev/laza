import 'package:flutter/material.dart';
import 'package:laza/common/theme/index.dart' show AppColors, AppTextStyles;
import 'package:laza/features/products/index.dart' show Category;

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.category, super.key});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(6, 5, 10, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.platinum,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
            child: Text(
              category.name?.split('').first.toUpperCase() ?? '-',
              style: AppTextStyles.s15W500.copyWith(
                color: AppColors.carbonBlack,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            category.name ?? '-',
            style: AppTextStyles.s15W500.copyWith(color: AppColors.carbonBlack),
          ),
        ],
      ),
    );
  }
}
