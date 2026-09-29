part of 'products_bloc.dart';

sealed class ProductsEvent {
  const ProductsEvent();
}

final class ProductsFetched extends ProductsEvent {
  const ProductsFetched({this.category, this.query, this.notify = false});
  final String? category;
  final String? query;
  final bool notify;
}

final class ProductsSearched extends ProductsEvent {
  const ProductsSearched();
}

final class ProductFetechedById extends ProductsEvent {
  const ProductFetechedById(this.uid);
  final String uid;
}

final class ProductAddedToCart extends ProductsEvent {
  const ProductAddedToCart();
}
