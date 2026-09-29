import 'package:laza/core/index.dart' show ResultVoid, ResultFuture;
import 'package:laza/features/cart/index.dart'
    show Address, CartItem, PaymentCard;

abstract class CartDataSource {
  ResultFuture<List<CartItem>> getCartItems();

  ResultFuture<List<CartItem>> updateCartItem({required CartItem item});

  ResultFuture<List<CartItem>> removeCartItem({required String id});

  ResultVoid addSavedAddress({required Address address});

  ResultFuture<List<Address>> getSavedAddress();

  ResultVoid addPaymentCards({required PaymentCard card});

  ResultFuture<List<PaymentCard>> getPaymentCards();

  ResultVoid checkout({
    required List<CartItem> items,
    required double totalCost,
  });
}
