part of 'address_bloc.dart';

sealed class AddressEvent {
  const AddressEvent();
}

final class AddressFetched extends AddressEvent {
  const AddressFetched();
}
