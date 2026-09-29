import 'package:laza/core/index.dart';
import 'package:laza/features/products/index.dart' show Product;

abstract class WishlistDataSource {
  ResultFuture<List<Product>> getWishlist();

  ResultVoid addToWishlist({required Product product});
}
