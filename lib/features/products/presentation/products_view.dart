import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart';
import 'package:laza/core/index.dart';
import 'package:laza/features/products/index.dart';
import 'package:laza/gen/assets.gen.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  final ProductsBloc _productsBloc = getIt();
  final CategoriesBloc _categoriesBloc = getIt();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _productsBloc.add(ProductsFetched(notify: true));
      _categoriesBloc.add(CategoriesFetched());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _productsBloc),
        BlocProvider.value(value: _categoriesBloc),
      ],
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(
          leading: InkWell(
            onTap: () {
              getIt<KeysRepository>().homeScaffoldKey.currentState
                  ?.openDrawer();
            },
            child: Container(
              height: 45,
              width: 45,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.platinum,
              ),
              child: SvgPicture.asset(
                Assets.icons.openMenu.path,
                height: 25,
                width: 25,
              ),
            ),
          ),
        ),

        body: RefreshIndicator(
          onRefresh: () async {
            _productsBloc.add(ProductsFetched(notify: true));
            _categoriesBloc.add(CategoriesFetched());
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: AppTextStyles.s28W600.copyWith(
                    color: AppColors.carbonBlack,
                  ),
                ),
                Text(
                  'Welcome to Laza.',
                  style: AppTextStyles.s15W400.copyWith(
                    color: AppColors.coolSteel,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: AppTextField(
                        onTap: () =>
                            context.pushNamed(RouteNames.searchProducts),
                        controller: TextEditingController(),
                        subtitle: 'Search...',
                        readOnly: true,
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
                      onTap: () => context.pushNamed(RouteNames.searchProducts),
                      child: Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.softPeriWinkle,
                        ),
                        child: Icon(Icons.chevron_right, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: AppTextStyles.s17W500.copyWith(
                        color: AppColors.carbonBlack,
                      ),
                    ),
                    // Text(
                    //   'View All',
                    //   style: AppTextStyles.s13W400.copyWith(
                    //     color: AppColors.coolSteel,
                    //   ),
                    // ),
                  ],
                ),

                const SizedBox(height: 16),
                BlocSelector<CategoriesBloc, CategoriesState, List<Category>>(
                  selector: (state) =>
                      state is CategoriesSuccess ? state.categories : [],
                  builder: (context, categories) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 10,
                        children: [
                          ...categories.map((c) => CategoryCard(category: c)),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Arrival',
                      style: AppTextStyles.s17W500.copyWith(
                        color: AppColors.carbonBlack,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                BlocSelector<ProductsBloc, ProductsState, ProductsState>(
                  selector: (state) => state,
                  builder: (context, state) {
                    if (state is ProductsLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is ProductsSuccess) {
                      return Products(
                        products: state.products,
                        onScrollToEnd: () {
                          if (!_productsBloc.noMoreDataAvailable) {
                            _productsBloc.add(ProductsFetched());
                          }
                        },
                      );
                    }
                    if (state is ProductsPaginationLoading) {
                      return Products(
                        products: state.products,
                        onScrollToEnd: () {
                          if (!_productsBloc.noMoreDataAvailable) {
                            _productsBloc.add(ProductsFetched());
                          }
                        },
                      );
                    }
                    return SizedBox.shrink();
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
