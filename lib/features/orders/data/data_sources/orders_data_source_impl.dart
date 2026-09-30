import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:dartz/dartz.dart' hide Order;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laza/core/index.dart';
import 'package:laza/features/orders/index.dart';

class OrdersDataSourceImpl implements OrdersDataSource {
  const OrdersDataSourceImpl({
    required this._firebaseAuth,
    required this._firebaseFirestore,
  });

  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  @override
  ResultFuture<List<Order>> getOrders() async {
    try {
      final orderSnapshot = await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser?.uid)
          .collection('orders')
          .get();

      final orders = orderSnapshot.docs
          .map((order) => Order.fromJson(order.data()))
          .toList();

      return Right(orders);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
