part of 'orders_bloc.dart';

sealed class OrderState {
  const OrderState();
}

final class OrderInitial extends OrderState {
  const OrderInitial();
}

final class OrderLoading extends OrderState {
  const OrderLoading();
}

final class OrderSuccess extends OrderState {
  const OrderSuccess(this.orders);

  final List<Order> orders;
}

final class OrderFailure extends OrderState {
  const OrderFailure(this.failure);

  final Failure? failure;
}
