part of 'wishlist_bloc.dart';

sealed class WishlistEvent {
  const WishlistEvent();
}

final class WishlistFetched extends WishlistEvent {
  const WishlistFetched();
}
