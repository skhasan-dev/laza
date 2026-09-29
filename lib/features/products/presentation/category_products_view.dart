import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/common/index.dart';
import 'package:laza/core/index.dart';
import 'package:laza/features/products/index.dart';

class CategoryProductsView extends StatefulWidget {
  const CategoryProductsView({required this.category, super.key});

  final Category category;

  @override
  State<CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<CategoryProductsView> {
  final ProductsBloc _productsBloc = getIt();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _productsBloc.add(ProductsFetched(category: widget.category.slug));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _productsBloc,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(
          title: Text(
            widget.category.name ?? '-',
            style: AppTextStyles.s17W600,
          ),
        ),

        body: BlocSelector<ProductsBloc, ProductsState, List<Product>>(
          selector: (state) => state is ProductsSuccess ? state.products : [],
          builder: (context, products) {
            return RefreshIndicator(
              onRefresh: () async {
                _productsBloc.add(
                  ProductsFetched(category: widget.category.slug),
                );
              },
              child: GridView.builder(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 80),
                physics: const AlwaysScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 260,
                ),
                itemCount: products.length,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
