import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza/common/index.dart';
import 'package:laza/features/cart/index.dart';
import 'package:laza/gen/assets.gen.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    required this.item,
    required this.onQuantityIncrease,
    required this.onQuantityDecrease,
    required this.onRemove,
    super.key,
  });

  final CartItem item;
  final VoidCallback onQuantityIncrease;
  final VoidCallback onQuantityDecrease;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 40),
            spreadRadius: -15,
            blurRadius: 100,
            color: AppColors.charcoalBlue.withValues(alpha: 0.25),
          ),
        ],
      ),
      child: Row(
        spacing: 15,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.platinum,
            ),
            child: Image.network(
              item.product?.thumbnail ?? '-',
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product?.title ?? '-',
                  style: AppTextStyles.s13W500.copyWith(
                    color: AppColors.carbonBlack,
                  ),
                ),
                Text(
                  item.product?.price.toString() ?? '-',
                  style: AppTextStyles.s11W400.copyWith(
                    color: AppColors.coolSteel,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 15,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: quantity <= 1 ? null : onQuantityDecrease,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.alabasterGrey2,
                              ),
                              color: quantity <= 1 ? AppColors.platinum : null,
                            ),
                            child: SvgPicture.asset(
                              Assets.icons.chevronDown.path,
                            ),
                          ),
                        ),
                        Text(
                          quantity.toString(),
                          style: AppTextStyles.s13W600.copyWith(
                            color: AppColors.carbonBlack,
                          ),
                        ),
                        GestureDetector(
                          onTap: onQuantityIncrease,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.alabasterGrey2,
                              ),
                            ),
                            child: SvgPicture.asset(
                              Assets.icons.chevronUp.path,
                            ),
                          ),
                        ),
                      ],
                    ),

                    GestureDetector(
                      onTap: onRemove,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.alabasterGrey2),
                        ),
                        child: SvgPicture.asset(Assets.icons.delete.path),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int get quantity => item.quantity ?? 0;
}
