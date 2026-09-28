part of 'cart_bloc.dart';

sealed class CartEvent {
  const CartEvent();
}

final class CartFetched extends CartEvent {
  const CartFetched();
}

final class CartCheckout extends CartEvent {
  const CartCheckout({required this.items, required this.totalCost});

  final List<CartItem> items;
  final double totalCost;
}
