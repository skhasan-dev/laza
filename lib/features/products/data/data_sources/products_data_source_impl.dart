import 'package:dartz/dartz.dart';
import 'package:laza/core/index.dart'
    show
        APIException,
        ResultFuture,
        Request,
        NetworkService,
        RequestMethod,
        Endpoints;

import 'package:laza/features/products/index.dart'
    show Category, Product, ProductsDataSource;

class ProductsDataSourceImpl implements ProductsDataSource {
  ProductsDataSourceImpl({required this._networkService});

  final NetworkService _networkService;

  @override
  ResultFuture<List<Category>> getCategories({required int page}) async {
    try {
      Request request = Request(
        method: RequestMethod.get,
        path: Endpoints.productsCategories,
      );

      final result = await _networkService.request(request);
      final response = result.data as List<dynamic>;

      if (response.isEmpty) {
        return Right([]);
      }

      final categories = response
          .map((json) => Category.fromJson(json as Map<String, dynamic>))
          .toList();

      return Right(categories);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<Product?> getProductById({required String id}) async {
    try {
      Request request = Request(
        method: RequestMethod.get,
        path: '${Endpoints.products}/$id',
      );

      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      final product = Product.fromJson(response);

      return Right(product);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<Product>> getProducts({
    required int page,
    String? category,
    String? search,
  }) async {
    String endpoint = Endpoints.products;
    if (search != null) {
      endpoint = '$endpoint/search';
    }

    if (category != null) {
      endpoint = '$endpoint/category/$category';
    }

    try {
      Request request = Request(
        method: RequestMethod.get,
        path: endpoint,
        queryParams: {'page': page, 'limit': 10, 'q': ?search},
      );

      final result = await _networkService.request(request);
      final response = result.data as List<dynamic>;

      if (response.isEmpty) {
        return Right([]);
      }

      final products = response
          .map((json) => Product.fromJson(json as Map<String, dynamic>))
          .toList();

      return Right(products);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
