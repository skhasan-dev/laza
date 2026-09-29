part of 'payment_card_bloc.dart';

sealed class PaymentCardState {
  const PaymentCardState();
}

class PaymentCardInitial extends PaymentCardState {
  const PaymentCardInitial();
}

class PaymentCardLoading extends PaymentCardState {
  const PaymentCardLoading();
}

class PaymentCardSuccess extends PaymentCardState {
  const PaymentCardSuccess({required this.items});

  final List<PaymentCard> items;
}

class PaymentCardFailure extends PaymentCardState {
  const PaymentCardFailure({this.failure});

  final Failure? failure;
}
