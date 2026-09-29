part of 'address_bloc.dart';

sealed class AddressState {
  const AddressState();
}

class AddressInitial extends AddressState {
  const AddressInitial();
}

class AddressLoading extends AddressState {
  const AddressLoading();
}

class AddressSuccess extends AddressState {
  const AddressSuccess({required this.items});

  final List<Address> items;
}

class AddressFailure extends AddressState {
  const AddressFailure({this.failure});

  final Failure? failure;
}
