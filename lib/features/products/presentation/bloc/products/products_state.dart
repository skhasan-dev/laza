import 'package:laza/core/index.dart' show Failure;
import 'package:laza/features/products/index.dart';

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
