import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/index.dart' show APIFailure, Failure;
import 'package:laza/features/cart/index.dart'
    show CartItem, CartRepository, Order;

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(this._cartRepository) : super(const CartInitial()) {
    on<CartFetched>(_onCartFetched);
    on<CartCheckout>(_onCartCheckout);
    on<CartItemRemoved>(_onCartItemRemoved);
    on<CartItemUpdated>(_onCartItemUpdated);
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
        emit(CartSuccess(items: items, total: calculateCost(items)));
      },
    );
  }

  Future<void> _onCartCheckout(
    CartCheckout event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());

    final result = await _cartRepository.checkout(order: event.order);

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
    final result = await _cartRepository.removeCartItem(id: event.id);

    result.fold(
      (failure) {
        emit(
          CartFailure(failure: APIFailure.fromException(exception: failure)),
        );
      },
      (products) {
        emit(CartSuccess(items: products, total: calculateCost(products)));
      },
    );
  }

  Future<void> _onCartItemUpdated(
    CartItemUpdated event,
    Emitter<CartState> emit,
  ) async {
    final result = await _cartRepository.updateCartItem(item: event.item);

    result.fold(
      (failure) {
        emit(
          CartFailure(failure: APIFailure.fromException(exception: failure)),
        );
      },
      (products) {
        emit(CartSuccess(items: products, total: calculateCost(products)));
      },
    );
  }

  double calculateCost(List<CartItem> items) {
    double cost = 0;
    for (final item in items) {
      cost += (item.quantity ?? 1) * (item.product?.price ?? 0);
    }
    return cost;
  }
}
