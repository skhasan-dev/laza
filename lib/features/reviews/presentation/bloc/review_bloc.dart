import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/index.dart' show APIFailure, Failure;
import 'package:laza/features/reviews/index.dart'
    show Review, ReviewsRepository;

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc(this._reviewsRepository) : super(const ReviewInitial()) {
    on<ReviewSubmitted>(_onReviewSubmitted);
    on<ReviewsFetched>(_onReviewFetched);
  }

  final ReviewsRepository _reviewsRepository;

  Future<void> _onReviewSubmitted(
    ReviewSubmitted event,
    Emitter<ReviewState> emit,
  ) async {
    emit(ReviewLoading());

    final result = await _reviewsRepository.addReview(
      review: event.review,
      productId: event.productId,
    );

    result.fold(
      (failure) {
        emit(
          ReviewFailure(failure: APIFailure.fromException(exception: failure)),
        );
      },
      (_) {
        emit(ReviewAddedSuccess());
      },
    );
  }

  Future<void> _onReviewFetched(
    ReviewsFetched event,
    Emitter<ReviewState> emit,
  ) async {
    emit(ReviewLoading());

    final result = await _reviewsRepository.getReviews(
      productId: event.productId,
    );

    result.fold(
      (failure) {
        emit(
          ReviewFailure(failure: APIFailure.fromException(exception: failure)),
        );
      },
      (reviews) {
        emit(ReviewSuccess(reviews: reviews));
      },
    );
  }
}
