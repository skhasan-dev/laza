import 'package:laza/core/index.dart';
import 'package:laza/features/orders/index.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  const OrdersRepositoryImpl({required this._dataSource});

  final OrdersDataSource _dataSource;

  @override
  ResultFuture<List<Order>> getOrders() => _dataSource.getOrders();
}
