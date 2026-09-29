import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/index.dart';
import 'package:laza/features/products/index.dart';
import 'package:laza/features/wishlist/index.dart';

part 'product_card_event.dart';
part 'product_card_state.dart';

class ProductCardBloc extends Bloc<ProductCardEvent, ProductCardState> {
  ProductCardBloc(this._wishlistRepository) : super(ProductCardInitial()) {
    on<ProductAddedToWishlist>(_onProductAddedToWishlist);
  }

  final WishlistRepository _wishlistRepository;

  Future<void> _onProductAddedToWishlist(
    ProductAddedToWishlist event,
    Emitter<ProductCardState> emit,
  ) async {
    emit(ProductCardLoading());

    final result = await _wishlistRepository.addToWishlist(
      product: event.product,
    );

    result.fold(
      (e) => emit(
        ProductCardFailure(failure: APIFailure.fromException(exception: e)),
      ),
      (r) {
        emit(ProductCardSuccess());
      },
    );
  }
}
