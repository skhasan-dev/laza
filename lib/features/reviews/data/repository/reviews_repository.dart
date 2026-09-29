import 'package:laza/core/index.dart' show ResultVoid, ResultFuture;
import 'package:laza/features/reviews/index.dart' show Review;

abstract class ReviewsRepository {
  ResultVoid addReview({required String productId, required Review review});

  ResultFuture<List<Review>> getReviews({required String productId});
}
