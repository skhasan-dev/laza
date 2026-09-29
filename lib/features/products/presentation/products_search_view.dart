import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/common/index.dart'
    show AppBackButton, AppColors, AppTextField, EmptyState;
import 'package:laza/core/index.dart' show getIt;
import 'package:laza/features/products/index.dart'
    show
        Product,
        ProductCard,
        ProductsBloc,
        ProductsFetched,
        ProductsLoading,
        ProductsState,
        ProductsSuccess;
import 'package:laza/gen/assets.gen.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProductsSearchView extends StatefulWidget {
  const ProductsSearchView({super.key});

  @override
  State<ProductsSearchView> createState() => _ProductsSearchViewState();
}

class _ProductsSearchViewState extends State<ProductsSearchView> {
  final focusNode = FocusNode();
  final ProductsBloc _productsBloc = getIt();
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _productsBloc,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  spacing: 10,
                  children: [
                    AppBackButton(),
                    Expanded(
                      child: AppTextField(
                        controller: searchController,
                        focusNode: focusNode,
                        subtitle: 'Search...',
                        onChanged: (value) {
                          EasyDebounce.debounce(
                            'search',
                            Duration(milliseconds: 500),
                            () async {
                              _productsBloc.add(
                                ProductsFetched(
                                  notify: true,
                                  query: searchController.text.trim(),
                                ),
                              );
                            },
                          );
                        },
                        prefixIcon: SvgPicture.asset(
                          Assets.icons.search.path,
                          height: 20,
                          width: 20,
                        ),
                        prefixIconConstraints: BoxConstraints(
                          minHeight: 20,
                          maxHeight: 20,
                          maxWidth: 30,
                          minWidth: 20,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        searchController.clear();
                      },
                      child: Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.softPeriWinkle,
                        ),
                        child: Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                BlocSelector<ProductsBloc, ProductsState, bool>(
                  selector: (state) => state is ProductsLoading,
                  builder: (context, isLoading) {
                    if (isLoading) return CircularProgressIndicator();

                    return Expanded(
                      child:
                          BlocSelector<
                            ProductsBloc,
                            ProductsState,
                            List<Product>
                          >(
                            selector: (state) =>
                                state is ProductsSuccess ? state.products : [],
                            builder: (context, products) {
                              if (products.isEmpty) {
                                return EmptyState(label: 'No items found!!');
                              }
                              return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 15,
                                      mainAxisExtent: 260,
                                    ),
                                itemCount: products.length,
                                shrinkWrap: true,
                                itemBuilder: (_, index) {
                                  final product = products[index];
                                  return VisibilityDetector(
                                    key: ValueKey(product.id ?? index),
                                    onVisibilityChanged: (info) {
                                      final percentage = info.visibleFraction;
                                      final lastIndex =
                                          index == products.length - 1;

                                      if (lastIndex && percentage == 1) {
                                        if (!_productsBloc
                                            .noMoreDataAvailable) {
                                          _productsBloc.add(
                                            ProductsFetched(
                                              query: searchController.text
                                                  .trim(),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    child: ProductCard(product: product),
                                  );
                                },
                              );
                            },
                          ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
