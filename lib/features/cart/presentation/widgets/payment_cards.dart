import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart' show AppTextStyles, AppColors;
import 'package:laza/core/index.dart' show RouteNames;
import 'package:laza/features/cart/index.dart'
    show PaymentCard, PaymentCardBloc, PaymentCardState, PaymentCardSuccess;
import 'package:laza/features/cart/presentation/bloc/payment_cards/index.dart';
import 'package:laza/gen/assets.gen.dart';

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
                  style: AppTextStyles.s17W500.copyWith(
                    color: AppColors.carbonBlack,
                  ),
                ),

                GestureDetector(
                  onTap: () async {
                    final result = await context.pushNamed(RouteNames.addCard);

                    if (result == true) {
                      context.read<PaymentCardBloc>().add(PaymentCardFetched());
                    }
                  },
                  child: Icon(Icons.chevron_right),
                ),
              ],
            ),
            const SizedBox(height: 15),

            if (items.isEmpty)
              Text(
                'No payment method found',
                style: AppTextStyles.s15W400.copyWith(
                  color: AppColors.coolSteel,
                ),
              )
            else
              Column(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...items.map((item) {
                    return Row(
                      spacing: 15,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: 'https://picsum.photos/600',
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.ownerName ?? '-',
                                style: AppTextStyles.s15W400.copyWith(
                                  color: AppColors.carbonBlack,
                                ),
                              ),
                              Text(
                                item.number ?? '-',
                                style: AppTextStyles.s13W400.copyWith(
                                  color: AppColors.coolSteel,
                                ),
                              ),
                            ],
                          ),
                        ),

                        if (item.primaryMethod ?? false)
                          SvgPicture.asset(
                            Assets.icons.check.path,
                            height: 25,
                            width: 25,
                          )
                        else
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.coolSteel),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    );
                  }),
                ],
              ),
          ],
        );
      },
    );
  }
}
