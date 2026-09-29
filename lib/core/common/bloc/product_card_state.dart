part of 'product_card_bloc.dart';

sealed class ProductCardState {
  const ProductCardState();
}

final class ProductCardInitial extends ProductCardState {
  const ProductCardInitial();
}

final class ProductCardLoading extends ProductCardState {
  const ProductCardLoading();
}

final class ProductCardSuccess extends ProductCardState {
  const ProductCardSuccess();
}

final class ProductCardFailure extends ProductCardState {
  const ProductCardFailure({this.failure});

  final Failure? failure;
}
