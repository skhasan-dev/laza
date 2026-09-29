part of 'payment_card_bloc.dart';

sealed class PaymentCardEvent {
  const PaymentCardEvent();
}

final class PaymentCardFetched extends PaymentCardEvent {
  const PaymentCardFetched();
}

final class PaymentCardAdded extends PaymentCardEvent {
  const PaymentCardAdded({required this.card});

  final PaymentCard card;
}
