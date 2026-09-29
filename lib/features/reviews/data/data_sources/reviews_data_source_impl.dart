import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:laza/core/index.dart'
    show ResultVoid, ResultFuture, APIException;
import 'package:laza/features/reviews/index.dart'
    show Review, ReviewsDataSource;

class ReviewsDataSourceImpl implements ReviewsDataSource {
  const ReviewsDataSourceImpl({required this._firebaseFirestore});

  final FirebaseFirestore _firebaseFirestore;

  @override
  ResultVoid addReview({
    required String productId,
    required Review review,
  }) async {
    try {
      await _firebaseFirestore
          .collection('products')
          .doc(productId)
          .collection('reviews')
          .add(review.toJson());

      return Right(null);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<Review>> getReviews({required String productId}) async {
    try {
      final reviewsSnapshot = await _firebaseFirestore
          .collection('products')
          .doc(productId)
          .collection('reviews')
          .get();

      final reviews = reviewsSnapshot.docs
          .map((doc) => Review.fromJson(doc.data()))
          .toList();

      return Right(reviews);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
