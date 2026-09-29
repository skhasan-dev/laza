part of 'review_bloc.dart';

sealed class ReviewEvent {
  const ReviewEvent();
}

final class ReviewSubmitted extends ReviewEvent {
  const ReviewSubmitted({required this.review, required this.productId});

  final Review review;
  final String productId;
}

final class ReviewsFetched extends ReviewEvent {
  const ReviewsFetched(this.productId);

  final String productId;
}
