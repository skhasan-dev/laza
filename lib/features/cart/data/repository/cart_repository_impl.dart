import 'package:laza/core/index.dart';
import 'package:laza/features/cart/index.dart';

class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl({required this._cartDataSource});

  final CartDataSource _cartDataSource;

  @override
  ResultFuture<List<CartItem>> getCartItems() => _cartDataSource.getCartItems();

  @override
  ResultFuture<List<PaymentCard>> getPaymentCards() =>
      _cartDataSource.getPaymentCards();

  @override
  ResultFuture<List<Address>> getSavedAddress() =>
      _cartDataSource.getSavedAddress();

  @override
  ResultVoid checkout({
    required List<CartItem> items,
    required double totalCost,
  }) => _cartDataSource.checkout(items: items, totalCost: totalCost);

  @override
  ResultVoid addPaymentCards({required PaymentCard card}) =>
      _cartDataSource.addPaymentCards(card: card);

  @override
  ResultVoid addSavedAddress({required Address address}) =>
      _cartDataSource.addSavedAddress(address: address);

  @override
  ResultFuture<List<CartItem>> updateCartItem({required CartItem item}) =>
      _cartDataSource.updateCartItem(item: item);

  @override
  ResultFuture<List<CartItem>> removeCartItem({required String id}) =>
      _cartDataSource.removeCartItem(id: id);
}
