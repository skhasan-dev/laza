import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart' show AppColors, AppTextStyles;
import 'package:laza/core/common/index.dart';
import 'package:laza/core/index.dart' show RouteNames, getIt;
import 'package:laza/features/products/index.dart' show Product;
import 'package:laza/gen/assets.gen.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({required this.product, super.key});
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final ProductCardBloc _productCardBloc = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _productCardBloc,
      child: GestureDetector(
        onTap: () => context.pushNamed(
          RouteNames.productDetail,
          extra: widget.product.id.toString(),
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
                    widget.product.thumbnail ?? '-',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: BlocSelector<ProductCardBloc, ProductCardState, bool>(
                    selector: (state) => state is ProductCardLoading,
                    builder: (context, isLoading) {
                      return GestureDetector(
                        onTap: isLoading
                            ? null
                            : () {
                                _productCardBloc.add(
                                  ProductAddedToWishlist(
                                    product: widget.product,
                                  ),
                                );
                              },
                        child: isLoading
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: AppColors.softPeriWinkle,
                                  strokeWidth: 2,
                                ),
                              )
                            : SvgPicture.asset(Assets.icons.heart.path),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              widget.product.title ?? '-',
              maxLines: 2,
              style: AppTextStyles.s11W500.copyWith(
                color: AppColors.carbonBlack,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              (widget.product.price ?? 0).toString(),
              maxLines: 2,
              style: AppTextStyles.s13W600.copyWith(
                color: AppColors.carbonBlack,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
