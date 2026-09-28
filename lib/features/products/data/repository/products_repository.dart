import 'package:laza/core/index.dart' show ResultFuture;
import 'package:laza/features/products/index.dart' show Category, Product;

abstract class ProductsRepository {
  ResultFuture<List<Category>> getCategories({required int page});

  ResultFuture<List<Product>> getProducts({
    required int page,
    String? category,
    String? search,
  });

  ResultFuture<Product?> getProductById({required String id});
}
