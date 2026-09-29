import 'package:laza/core/index.dart' show ResultFuture, ResultVoid;
import 'package:laza/features/products/index.dart' show Category, Product;

abstract class ProductsDataSource {
  ResultFuture<List<Category>> getCategories({required int page});

  ResultFuture<List<Product>> getProducts({
    required int page,
    String? category,
    String? search,
  });

  ResultVoid addToCart({required Product product});

  ResultFuture<Product?> getProductById({required String id});
}
