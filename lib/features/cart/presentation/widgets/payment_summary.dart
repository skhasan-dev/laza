import 'package:flutter/material.dart';
import 'package:laza/common/index.dart' show AppTextStyles, AppColors;
import 'package:laza/core/index.dart' show DoubleExt;

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({
    required this.total,
    required this.shippingCharges,
    super.key,
  });

  final num total;
  final num shippingCharges;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildRow(
          key: 'Order Info',
          keyStyle: AppTextStyles.s17W500.copyWith(
            color: AppColors.carbonBlack,
          ),
        ),
        const SizedBox(height: 15),
        _buildRow(key: 'Subtotal', value: total.toDouble().price),
        const SizedBox(height: 10),
        _buildRow(
          key: 'Shipping cost',
          value: shippingCharges.toDouble().price,
        ),
        const SizedBox(height: 15),
        _buildRow(
          key: 'Total',
          value: (total + shippingCharges).toDouble().price,
        ),
      ],
    );
  }

  Widget _buildRow({required String key, TextStyle? keyStyle, String? value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style:
              keyStyle ??
              AppTextStyles.s15W400.copyWith(color: AppColors.coolSteel),
        ),
        if (value != null)
          Text(
            value,
            style: AppTextStyles.s15W500.copyWith(color: AppColors.carbonBlack),
          ),
      ],
    );
  }
}
