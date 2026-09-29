import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart' show AppTextStyles, AppColors;
import 'package:laza/core/index.dart';
import 'package:laza/features/cart/index.dart'
    show Address, AddressBloc, AddressState, AddressSuccess;
import 'package:laza/features/cart/presentation/index.dart';
import 'package:laza/gen/assets.gen.dart';

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
                  style: AppTextStyles.s17W500.copyWith(
                    color: AppColors.carbonBlack,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final result = await context.pushNamed(RouteNames.address);

                    if (result == true) {
                      context.read<AddressBloc>().add(AddressFetched());
                    }
                  },
                  child: Icon(Icons.chevron_right),
                ),
              ],
            ),
            const SizedBox(height: 15),

            if (items.isEmpty)
              Text(
                'No address found',
                style: AppTextStyles.s15W400.copyWith(
                  color: AppColors.coolSteel,
                ),
              )
            else
              Column(
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
                          child: Image.network('https://picsum.photos/600'),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.address ?? '-',
                                style: AppTextStyles.s15W400.copyWith(
                                  color: AppColors.carbonBlack,
                                ),
                              ),
                              Text(
                                item.name ?? '-',
                                style: AppTextStyles.s13W400.copyWith(
                                  color: AppColors.coolSteel,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (item.primaryAddress ?? false)
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
