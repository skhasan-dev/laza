import 'package:laza/core/index.dart' show ResultFuture, ResultVoid;
import 'package:laza/features/products/index.dart' show Product;
import 'package:laza/features/wishlist/index.dart'
    show WishlistRepository, WishlistDataSource;

class WishlistRepositoryImpl implements WishlistRepository {
  const WishlistRepositoryImpl({required this._dataSource});

  final WishlistDataSource _dataSource;

  @override
  ResultFuture<List<Product>> getWishlist() => _dataSource.getWishlist();

  @override
  ResultVoid addToWishlist({required Product product}) =>
      _dataSource.addToWishlist(product: product);
}
