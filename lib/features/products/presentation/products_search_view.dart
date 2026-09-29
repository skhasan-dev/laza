import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/common/index.dart'
    show AppBackButton, AppColors, AppTextField, EmptyState;
import 'package:laza/core/index.dart' show getIt;
import 'package:laza/features/products/index.dart'
    show
        Products,
        ProductsBloc,
        ProductsFetched,
        ProductsLoading,
        ProductsPaginationLoading,
        ProductsState,
        ProductsSuccess;
import 'package:laza/gen/assets.gen.dart';

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
                Expanded(
                  child:
                      BlocSelector<ProductsBloc, ProductsState, ProductsState>(
                        selector: (state) => state,
                        builder: (context, state) {
                          if (state is ProductsLoading) {
                            return Center(child: CircularProgressIndicator());
                          }

                          if (state is ProductsSuccess) {
                            if (state.products.isEmpty) {
                              return EmptyState(label: 'No items found!!');
                            }

                            return Products(
                              products: state.products,
                              physics: AlwaysScrollableScrollPhysics(),
                              onScrollToEnd: () {
                                if (!_productsBloc.noMoreDataAvailable) {
                                  _productsBloc.add(
                                    ProductsFetched(
                                      query: searchController.text.trim(),
                                    ),
                                  );
                                }
                              },
                            );
                          }
                          if (state is ProductsPaginationLoading) {
                            return Products(
                              products: state.products,
                              physics: AlwaysScrollableScrollPhysics(),
                              onScrollToEnd: () {
                                if (!_productsBloc.noMoreDataAvailable) {
                                  _productsBloc.add(
                                    ProductsFetched(
                                      query: searchController.text.trim(),
                                    ),
                                  );
                                }
                              },
                            );
                          }

                          return SizedBox.shrink();
                        },
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
