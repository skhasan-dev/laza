import 'package:laza/core/index.dart' show ResultFuture;
import 'package:laza/features/products/index.dart'
    show Category, Product, ProductsRepository, ProductsDataSource;

class ProductsRepositoryImpl implements ProductsRepository {
  const ProductsRepositoryImpl({required this._dataSource});

  final ProductsDataSource _dataSource;

  @override
  ResultFuture<List<Category>> getCategories({required int page}) =>
      _dataSource.getCategories(page: page);

  @override
  ResultFuture<Product?> getProductById({required String id}) =>
      _dataSource.getProductById(id: id);

  @override
  ResultFuture<List<Product>> getProducts({
    required int page,
    String? category,
    String? search,
  }) => _dataSource.getProducts(page: page, category: category, search: search);
}
