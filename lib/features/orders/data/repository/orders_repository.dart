import 'package:laza/core/index.dart' show ResultFuture;
import 'package:laza/features/orders/index.dart' show Order;

abstract class OrdersRepository {
  ResultFuture<List<Order>> getOrders();
}
