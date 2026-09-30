import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/index.dart';
import 'package:laza/features/orders/index.dart' show Order, OrdersRepository;

part 'orders_state.dart';
part 'orders_event.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrderState> {
  OrdersBloc(this._ordersRepository) : super(OrderInitial()) {
    on<OrderFetched>(_onOrderFetched);
  }

  final OrdersRepository _ordersRepository;

  Future<void> _onOrderFetched(
    OrderFetched event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());

    final result = await _ordersRepository.getOrders();

    result.fold(
      (e) => emit(OrderFailure(APIFailure.fromException(exception: e))),
      (orders) => emit(OrderSuccess(orders)),
    );
  }
}
