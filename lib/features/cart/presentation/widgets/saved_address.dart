import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/common/index.dart' show AppTextStyles, AppColors;
import 'package:laza/features/cart/index.dart'
    show Address, AddressBloc, AddressState, AddressSuccess;

class SavedAddress extends StatelessWidget {
  const SavedAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddressBloc, AddressState, List<Address>>(
      selector: (state) => (state is AddressSuccess) ? state.items : [],
      builder: (context, items) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Address',
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
                'No address found',
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
