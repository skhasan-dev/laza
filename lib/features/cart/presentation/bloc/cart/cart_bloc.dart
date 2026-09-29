import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/index.dart' show APIFailure, Failure;
import 'package:laza/features/cart/index.dart' show CartItem, CartRepository;

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(this._cartRepository) : super(const CartInitial()) {
    on<CartFetched>(_onCartFetched);
    on<CartCheckout>(_onCartCheckout);
    on<CartItemRemoved>(_onCartItemRemoved);
  }

  final CartRepository _cartRepository;

  Future<void> _onCartFetched(
    CartFetched event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());

    final result = await _cartRepository.getCartItems();

    result.fold(
      (failure) {
        emit(
          CartFailure(failure: APIFailure.fromException(exception: failure)),
        );
      },
      (items) {
        emit(CartSuccess(items: items));
      },
    );
  }

  Future<void> _onCartCheckout(
    CartCheckout event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());

    final result = await _cartRepository.checkout(
      items: event.items,
      totalCost: event.totalCost,
    );

    result.fold(
      (failure) {
        emit(
          CartFailure(failure: APIFailure.fromException(exception: failure)),
        );
      },
      (_) {
        emit(CartCheckoutSuccess());
      },
    );
  }

  Future<void> _onCartItemRemoved(
    CartItemRemoved event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());

    final result = await _cartRepository.removeCartItem(id: event.id);

    result.fold(
      (failure) {
        emit(
          CartFailure(failure: APIFailure.fromException(exception: failure)),
        );
      },
      (products) {
        emit(CartSuccess(items: products));
      },
    );
  }
}
