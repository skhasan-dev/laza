import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laza/core/index.dart'
    show
        APIException,
        ResultFuture,
        Request,
        NetworkService,
        RequestMethod,
        Endpoints,
        ResultVoid;

import 'package:laza/features/products/index.dart'
    show Category, Product, ProductsDataSource;

class ProductsDataSourceImpl implements ProductsDataSource {
  ProductsDataSourceImpl({
    required this._networkService,
    required this._firebaseFirestore,
    required this._firebaseAuth,
  });

  final NetworkService _networkService;
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

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
        queryParams: {
          'skip': ((page - 1) * 10).toString(),
          'limit': '10',
          'q': ?search,
        },
      );

      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      if (response.isEmpty) {
        return Right([]);
      }

      final products = (response['products'] as List<dynamic>)
          .map((json) => Product.fromJson(json as Map<String, dynamic>))
          .toList();

      return Right(products);
    } catch (e, s) {
      log('$e\n$s');
      return Left(APIException.from(e));
    }
  }

  @override
  ResultVoid addToCart({required Product product}) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('cart')
          .doc(product.id.toString())
          .set({
            'id': (product.id ?? 0).toString(),
            'quantity': 1,
            'product': product.toJson(),
          });

      return Right(null);
    } catch (e, s) {
      log('$e\n$s');
      return Left(APIException.from(e));
    }
  }
}
