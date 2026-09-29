import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/common/index.dart'
    show AppTextStyles, CustomAppBar, AppColors;
import 'package:laza/core/index.dart' show getIt;
import 'package:laza/features/products/index.dart' show ProductCard, Product;
import 'package:laza/features/wishlist/index.dart'
    show WishlistBloc, WishlistFetched, WishlistState, WishlistSuccess;

class WishlistView extends StatefulWidget {
  const new({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  final WishlistBloc _wishlistBloc = getIt();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _wishlistBloc.add(WishlistFetched());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _wishlistBloc,
      child: Scaffold(
        backgroundColor: AppColors.white,

        appBar: CustomAppBar(
          title: Text('Wishlist', style: AppTextStyles.s17W600),
        ),

        body: BlocSelector<WishlistBloc, WishlistState, List<Product>>(
          selector: (state) => state is WishlistSuccess ? state.products : [],
          builder: (context, products) {
            if (products.isEmpty) {
              return Center(
                child: Text(
                  'No Products in Wishlist\nAdd Now!!',
                  style: AppTextStyles.s15W500.copyWith(
                    color: AppColors.coolSteel,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }
            return GridView.builder(
              padding: EdgeInsets.all(20),
              physics: const NeverScrollableScrollPhysics(),
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
            );
          },
        ),
      ),
    );
  }
}
