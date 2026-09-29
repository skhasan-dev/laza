import 'package:laza/core/index.dart' show ResultVoid, ResultFuture;
import 'package:laza/features/reviews/index.dart'
    show Review, ReviewsRepository, ReviewsDataSource;

class ReviewsRepositoryImpl implements ReviewsRepository {
  const ReviewsRepositoryImpl({required this._dataSource});

  final ReviewsDataSource _dataSource;

  @override
  ResultVoid addReview({required String productId, required Review review}) =>
      _dataSource.addReview(productId: productId, review: review);

  @override
  ResultFuture<List<Review>> getReviews({required String productId}) =>
      _dataSource.getReviews(productId: productId);
}
