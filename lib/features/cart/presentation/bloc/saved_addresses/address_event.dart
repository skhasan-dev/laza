part of 'address_bloc.dart';

sealed class AddressEvent {
  const AddressEvent();
}

final class AddressFetched extends AddressEvent {
  const AddressFetched();
}

final class AddressSaved extends AddressEvent {
  const AddressSaved({required this.address});

  final Address address;
}
