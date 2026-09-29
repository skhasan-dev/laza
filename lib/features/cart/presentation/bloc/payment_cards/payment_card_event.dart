part of 'payment_card_bloc.dart';

sealed class PaymentCardEvent {
  const PaymentCardEvent();
}

final class PaymentCardFetched extends PaymentCardEvent {
  const PaymentCardFetched();
}
