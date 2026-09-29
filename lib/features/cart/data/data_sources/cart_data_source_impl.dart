import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laza/core/index.dart';
import 'package:laza/features/cart/index.dart';

class CartDataSourceImpl implements CartDataSource {
  CartDataSourceImpl({
    required this._firebaseFirestore,
    required this._firebaseAuth,
  });

  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  @override
  ResultFuture<List<CartItem>> getCartItems() async {
    try {
      final cartItemsSnapshot = await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('cart')
          .get();

      final cartItems = cartItemsSnapshot.docs
          .map((doc) => CartItem.fromJson(doc.data()))
          .toList();

      return Right(cartItems);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<PaymentCard>> getPaymentCards() async {
    try {
      final cardsSnapshot = await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('payment_cards')
          .get();

      final cards = cardsSnapshot.docs
          .map((doc) => PaymentCard.fromJson(doc.data()))
          .toList();

      return Right(cards);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<Address>> getSavedAddress() async {
    try {
      final addressesSnapshot = await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('addresses')
          .get();

      final addresses = addressesSnapshot.docs
          .map((doc) => Address.fromJson(doc.data()))
          .toList();

      return Right(addresses);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultVoid checkout({
    required List<CartItem> items,
    required double totalCost,
  }) async {
    final id =
        '${_firebaseAuth.currentUser?.uid}_${DateTime.now().toIso8601String()}';
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('orders')
          .doc(id)
          .set({
            'id': id,
            'items': items,
            'cost': totalCost.toString(),
            'status': 'confirmed',
          });

      return Right(null);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultVoid addPaymentCards({required PaymentCard card}) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('payment_cards')
          .doc(card.id ?? '-')
          .set(card.toJson());

      return Right(null);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultVoid addSavedAddress({required Address address}) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('addresses')
          .doc(address.id ?? '-')
          .set(address.toJson());

      return Right(null);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultVoid updateCartItem({required CartItem item}) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('cart')
          .doc(item.id ?? '-')
          .update({'quantity': item.quantity ?? 0});

      return Right(null);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<CartItem>> removeCartItem({required String id}) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('cart')
          .doc(id)
          .delete();

      final cartItemsSnapshot = await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('cart')
          .get();

      final cartItems = cartItemsSnapshot.docs
          .map((doc) => CartItem.fromJson(doc.data()))
          .toList();

      return Right(cartItems);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
