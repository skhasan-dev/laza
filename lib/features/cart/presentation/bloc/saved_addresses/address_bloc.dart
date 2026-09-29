import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/index.dart' show APIFailure, Failure;
import 'package:laza/features/cart/index.dart' show Address, CartRepository;

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc(this._cartRepository) : super(const AddressInitial()) {
    on<AddressFetched>(_onAddressFetched);
  }

  final CartRepository _cartRepository;

  Future<void> _onAddressFetched(
    AddressFetched event,
    Emitter<AddressState> emit,
  ) async {
    emit(AddressLoading());

    final result = await _cartRepository.getSavedAddress();

    result.fold(
      (failure) {
        emit(
          AddressFailure(failure: APIFailure.fromException(exception: failure)),
        );
      },
      (items) {
        emit(AddressSuccess(items: items));
      },
    );
  }
}
