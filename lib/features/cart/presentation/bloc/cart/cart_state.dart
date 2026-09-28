part of 'cart_bloc.dart';

sealed class CartState {
  const CartState();
}

class CartInitial extends CartState {
  const CartInitial();
}

class CartLoading extends CartState {
  const CartLoading();
}

class CartSuccess extends CartState {
  const CartSuccess({required this.items});

  final List<CartItem> items;
}

class CartCheckoutSuccess extends CartState {
  const CartCheckoutSuccess();
}

class CartFailure extends CartState {
  const CartFailure({this.failure});

  final Failure? failure;
}
