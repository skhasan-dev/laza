import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laza/core/index.dart' show APIException, ResultFuture;
import 'package:laza/core/utils/typedefs.dart';
import 'package:laza/features/products/index.dart' show Product;
import 'package:laza/features/wishlist/index.dart' show WishlistDataSource;

class WishlistDataSourceImpl implements WishlistDataSource {
  WishlistDataSourceImpl({
    required this._firebaseFirestore,
    required this._firebaseAuth,
  });

  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  @override
  ResultFuture<List<Product>> getWishlist() async {
    try {
      final wishlist = await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('wishlist')
          .get();

      final products = wishlist.docs
          .map((doc) => Product.fromJson(doc.data()))
          .toList();

      return Right(products);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultVoid addToWishlist({required Product product}) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('wishlist')
          .doc(product.id.toString())
          .set(product.toJson());

      return Right(null);
    } catch (e, s) {
      log('$e\n$s');
      return Left(APIException.from(e));
    }
  }
}
