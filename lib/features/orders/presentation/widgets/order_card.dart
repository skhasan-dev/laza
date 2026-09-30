import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:laza/features/cart/index.dart';
import 'package:laza/features/orders/index.dart';
import 'package:laza/common/index.dart' show AppColors, AppTextStyles;

class OrderCard extends StatelessWidget {
  const OrderCard({required this.order, super.key});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            spreadRadius: 0,
            blurRadius: 4,
            color: Colors.black.withValues(alpha: 0.2),
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
            child: CachedNetworkImage(
              imageUrl: firstItem?.product?.thumbnail ?? '-',
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${firstItem?.product?.title ?? '-'}  ${orderLength > 2 ? 'x${orderLength - 1}' : ''}',
                  style: AppTextStyles.s15W500.copyWith(
                    color: AppColors.carbonBlack,
                  ),
                ),
                Text(
                  order.createdAt?.toIso8601String() ?? '-',
                  style: AppTextStyles.s11W400.copyWith(
                    color: AppColors.coolSteel,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20,
                          color: AppColors.carbonBlack,
                        ),
                        Text(
                          '${order.shippingAddress?.city ?? ''} x ${(order.shippingAddress?.country ?? '')} ',
                          style: AppTextStyles.s15W500.copyWith(
                            color: AppColors.carbonBlack,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '\$${order.total ?? 0}',
                      style: AppTextStyles.s15W500.copyWith(
                        color: AppColors.carbonBlack,
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

  CartItem? get firstItem => order.items?.firstOrNull;
  int get orderLength => order.items?.length ?? 0;
}
