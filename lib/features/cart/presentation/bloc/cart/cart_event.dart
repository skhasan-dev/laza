part of 'cart_bloc.dart';

sealed class CartEvent {
  const CartEvent();
}

final class CartFetched extends CartEvent {
  const CartFetched();
}

final class CartItemRemoved extends CartEvent {
  const CartItemRemoved({required this.id});
  final String id;
}

final class CartItemUpdated extends CartEvent {
  const CartItemUpdated({required this.item});

  final CartItem item;
}

final class CartCheckout extends CartEvent {
  const CartCheckout({required this.order});

  final Order order;
}
