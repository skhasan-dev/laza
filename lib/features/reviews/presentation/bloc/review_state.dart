part of 'review_bloc.dart';

sealed class ReviewState {
  const ReviewState();
}

final class ReviewInitial extends ReviewState {
  const ReviewInitial();
}

final class ReviewLoading extends ReviewState {
  const ReviewLoading();
}

final class ReviewSuccess extends ReviewState {
  const ReviewSuccess({required this.reviews});

  final List<Review> reviews;
}

final class ReviewAddedSuccess extends ReviewState {
  const ReviewAddedSuccess();
}

final class ReviewFailure extends ReviewState {
  const ReviewFailure({required this.failure});

  final Failure? failure;
}
