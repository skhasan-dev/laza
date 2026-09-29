import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart'
    show AppColors, AppTextStyles, CustomAppBar, EmptyState;
import 'package:laza/core/index.dart' show RouteNames, getIt;
import 'package:laza/features/products/index.dart' show ProductCard;
import 'package:laza/features/wishlist/index.dart'
    show
        WishlistBloc,
        WishlistFetched,
        WishlistLoading,
        WishlistState,
        WishlistSuccess;

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

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
          onBackPressed: () => context.goNamed(RouteNames.home),
          title: Text('Wishlist', style: AppTextStyles.s17W600),
        ),

        body: BlocSelector<WishlistBloc, WishlistState, WishlistState>(
          selector: (state) => state,
          builder: (context, state) {
            if (state is WishlistLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is WishlistSuccess) {
              final products = state.products;

              return RefreshIndicator(
                onRefresh: () async {
                  _wishlistBloc.add(WishlistFetched());
                },
                child: products.isEmpty
                    ? EmptyState(label: 'No Products in Wishlist\nAdd Now!!')
                    : GridView.builder(
                        padding: EdgeInsets.all(20),
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
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
