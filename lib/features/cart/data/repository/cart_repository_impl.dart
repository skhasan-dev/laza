import 'package:laza/core/index.dart';
import 'package:laza/features/cart/index.dart';
import 'package:laza/features/orders/index.dart' show Order;

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
  ResultVoid checkout({required Order order}) =>
      _cartDataSource.checkout(order: order);

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
