part of 'wishlist_bloc.dart';

sealed class WishlistState {
  const WishlistState();
}

final class WishlistInitial extends WishlistState {
  const WishlistInitial();
}

final class WishlistLoading extends WishlistState {
  const WishlistLoading();
}

final class WishlistSuccess extends WishlistState {
  const WishlistSuccess(this.products);

  final List<Product> products;
}

final class WishlistFailure extends WishlistState {
  const WishlistFailure({required this.failure});

  final Failure? failure;
}
