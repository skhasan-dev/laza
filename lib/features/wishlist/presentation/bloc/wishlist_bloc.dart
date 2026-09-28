import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/index.dart' show Failure, APIFailure;
import 'package:laza/features/products/index.dart' show Product;
import 'package:laza/features/wishlist/index.dart' show WishlistRepository;

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc(this._wishlistRepository) : super(const WishlistInitial()) {
    on<WishlistFetched>(_onWishlistFetched);
  }

  final WishlistRepository _wishlistRepository;

  Future<void> _onWishlistFetched(
    WishlistFetched event,
    Emitter<WishlistState> emit,
  ) async {
    emit(const WishlistLoading());

    final result = await _wishlistRepository.getWishlist();

    result.fold(
      (failure) {
        emit(
          WishlistFailure(
            failure: APIFailure.fromException(exception: failure),
          ),
        );
      },
      (products) {
        emit(WishlistSuccess(products));
      },
    );
  }
}
