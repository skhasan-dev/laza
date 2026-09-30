part of 'orders_bloc.dart';

sealed class OrdersEvent {
  const OrdersEvent();
}

final class OrderFetched extends OrdersEvent {
  const OrderFetched();
}
