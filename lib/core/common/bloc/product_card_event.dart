part of 'product_card_bloc.dart';

sealed class ProductCardEvent {
  const ProductCardEvent();
}

final class ProductAddedToWishlist extends ProductCardEvent {
  const ProductAddedToWishlist({required this.product});
  final Product product;
}
