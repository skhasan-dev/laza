import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart' show AppColors, AppTextStyles;
import 'package:laza/core/index.dart' show RouteNames;
import 'package:laza/features/products/index.dart' show Product;
import 'package:laza/gen/assets.gen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        RouteNames.productDetail,
        extra: product.id.toString(),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.whiteSmoke,
                ),
                child: Image.network(
                  product.thumbnail ?? '-',
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 12,
                top: 12,
                child: SvgPicture.asset(Assets.icons.heart.path),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            product.title ?? '-',
            maxLines: 2,
            style: AppTextStyles.s11W500.copyWith(
              color: AppColors.carbonBlack,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            (product.price ?? 0).toString(),
            maxLines: 2,
            style: AppTextStyles.s13W600.copyWith(
              color: AppColors.carbonBlack,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
