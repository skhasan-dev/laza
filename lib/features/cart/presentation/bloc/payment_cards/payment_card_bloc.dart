import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/index.dart' show APIFailure, Failure;
import 'package:laza/features/cart/index.dart' show PaymentCard, CartRepository;

part 'payment_card_event.dart';
part 'payment_card_state.dart';

class PaymentCardBloc extends Bloc<PaymentCardEvent, PaymentCardState> {
  PaymentCardBloc(this._cartRepository) : super(const PaymentCardInitial()) {
    on<PaymentCardFetched>(_onPaymentCardFetched);
    on<PaymentCardAdded>(_onPaymentCardAdded);
  }

  final CartRepository _cartRepository;

  Future<void> _onPaymentCardFetched(
    PaymentCardFetched event,
    Emitter<PaymentCardState> emit,
  ) async {
    emit(PaymentCardLoading());

    final result = await _cartRepository.getPaymentCards();

    result.fold(
      (failure) {
        emit(
          PaymentCardFailure(
            failure: APIFailure.fromException(exception: failure),
          ),
        );
      },
      (items) {
        emit(PaymentCardSuccess(items: items));
      },
    );
  }

  Future<void> _onPaymentCardAdded(
    PaymentCardAdded event,
    Emitter<PaymentCardState> emit,
  ) async {
    emit(PaymentCardLoading());

    final result = await _cartRepository.addPaymentCards(card: event.card);

    result.fold(
      (failure) {
        emit(
          PaymentCardFailure(
            failure: APIFailure.fromException(exception: failure),
          ),
        );
      },
      (items) {
        emit(PaymentCardSuccess(items: []));
      },
    );
  }
}
