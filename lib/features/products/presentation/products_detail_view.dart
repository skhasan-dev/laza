import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart'
    show AppButton, AppColors, AppTextStyles, CustomAppBar;
import 'package:laza/core/index.dart' show RouteNames, getIt;
import 'package:laza/features/products/index.dart'
    show
        ProductsBloc,
        ProductsState,
        Product,
        ProductsSuccess,
        ProductFetechedById;
import 'package:laza/features/reviews/index.dart';

class ProductsDetailView extends StatefulWidget {
  const ProductsDetailView({required this.uid, super.key});

  final String uid;

  @override
  State<ProductsDetailView> createState() => _ProductsDetailViewState();
}

class _ProductsDetailViewState extends State<ProductsDetailView> {
  final ProductsBloc _productsBloc = getIt();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _productsBloc.add(ProductFetechedById(widget.uid));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _productsBloc,
      child: Scaffold(
        appBar: CustomAppBar(backgroundColor: Colors.transparent),
        backgroundColor: AppColors.white,
        extendBodyBehindAppBar: true,
        body: BlocSelector<ProductsBloc, ProductsState, Product?>(
          selector: (state) =>
              (state is ProductsSuccess) ? state.products.firstOrNull : null,
          builder: (context, product) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      color: AppColors.whiteSmoke,
                      child: Image.network(
                        product?.thumbnail ?? '-',
                        fit: BoxFit.contain,
                        height: MediaQuery.sizeOf(context).height * 0.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 16,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                product?.title ?? '-',
                                style: AppTextStyles.s22W600.copyWith(
                                  color: AppColors.carbonBlack,
                                ),
                              ),
                            ),
                            Column(
                              spacing: 8,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price',
                                  style: AppTextStyles.s13W400.copyWith(
                                    color: AppColors.coolSteel,
                                  ),
                                ),
                                Text(
                                  product?.price.toString() ?? '-',
                                  style: AppTextStyles.s22W600.copyWith(
                                    color: AppColors.carbonBlack,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          spacing: 16,
                          children: [
                            ...(product?.images ?? []).map((img) {
                              return Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: AppColors.platinum,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(img),
                              );
                            }),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Description',
                          style: AppTextStyles.s17W600.copyWith(
                            color: AppColors.carbonBlack,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          product?.description ?? '-',
                          style: AppTextStyles.s15W400.copyWith(
                            color: AppColors.coolSteel,
                          ),
                        ),
                        if (reviewsCount(product) > 0) ...[
                          const SizedBox(height: 15),

                          GestureDetector(
                            onTap: () => context.pushNamed(
                              RouteNames.review,
                              extra: {
                                'id': product?.id.toString(),
                                'reviews': product?.reviews ?? [],
                              },
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Reviews',
                                  style: AppTextStyles.s17W600.copyWith(
                                    color: AppColors.carbonBlack,
                                  ),
                                ),
                                if (reviewsCount(product) > 1)
                                  Text(
                                    'View All',
                                    style: AppTextStyles.s13W400.copyWith(
                                      color: AppColors.coolSteel,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          ReviewCard(review: product!.reviews!.first),
                        ],
                        const SizedBox(height: 60),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        bottomNavigationBar: AppButton(label: 'Add to Cart'),
      ),
    );
  }

  int reviewsCount(Product? product) => (product?.reviews ?? []).length;
}
