import 'package:laza/core/index.dart';
import 'package:laza/features/products/index.dart' show Product;

abstract class WishlistRepository {
  ResultFuture<List<Product>> getWishlist();

  ResultVoid addToWishlist({required Product product});
}
