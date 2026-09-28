import 'package:laza/core/index.dart' show ResultFuture, ResultVoid;
import 'package:laza/features/cart/index.dart'
    show Address, CartItem, PaymentCard;

abstract class CartRepository {
  ResultFuture<List<CartItem>> getCartItems();

  ResultVoid updateCartItem({required CartItem item});

  ResultVoid addSavedAddress({required Address address});

  ResultFuture<List<Address>> getSavedAddress();

  ResultVoid addPaymentCards({required PaymentCard card});

  ResultFuture<List<PaymentCard>> getPaymentCards();

  ResultVoid checkout({
    required List<CartItem> items,
    required double totalCost,
  });
}
