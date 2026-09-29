import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/common/index.dart' show AppTextStyles, AppColors;
import 'package:laza/features/cart/index.dart'
    show PaymentCard, PaymentCardBloc, PaymentCardState, PaymentCardSuccess;

class PaymentCards extends StatelessWidget {
  const PaymentCards({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PaymentCardBloc, PaymentCardState, List<PaymentCard>>(
      selector: (state) => (state is PaymentCardSuccess) ? state.items : [],
      builder: (context, items) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Method',
                  style: AppTextStyles.s15W400.copyWith(
                    color: AppColors.coolSteel,
                  ),
                ),
                Icon(Icons.chevron_right),
              ],
            ),
            const SizedBox(height: 15),

            if (items.isEmpty)
              Text(
                'No payment method found',
                style: AppTextStyles.s15W400.copyWith(
                  color: AppColors.coolSteel,
                ),
              ),
          ],
        );
      },
    );
  }
}
