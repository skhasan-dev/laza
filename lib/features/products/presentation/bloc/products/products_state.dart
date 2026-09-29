part of 'products_bloc.dart';

sealed class ProductsState {
  const ProductsState();
}

final class ProductsInitial extends ProductsState {
  const ProductsInitial();
}

final class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

final class ProductsPaginationLoading extends ProductsState {
  const ProductsPaginationLoading();
}

final class ProductsSuccess extends ProductsState {
  const ProductsSuccess(this.products);

  final List<Product> products;
}

final class ProductsFailure extends ProductsState {
  const ProductsFailure({required this.failure});

  final Failure? failure;
}

final class ProductAddToCartSuccess extends ProductsState {
  const ProductAddToCartSuccess();
}

final class ProductAddingToCart extends ProductsState {
  const ProductAddingToCart();
}
