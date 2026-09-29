import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:dartz/dartz.dart' hide Order;
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

      cards.sort((a, b) {
        if (a.primaryMethod == true) {
          return -1;
        }

        if (b.primaryMethod == true) {
          return 1;
        }

        return 0;
      });

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

      addresses.sort((a, b) {
        if (a.primaryAddress == true) {
          return -1;
        }

        if (b.primaryAddress == true) {
          return 1;
        }

        return 0;
      });

      return Right(addresses);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultVoid checkout({required Order order}) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('orders')
          .add(order.toJson());

      final cartSnapshot = await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('cart')
          .get();

      for (final doc in cartSnapshot.docs) {
        await doc.reference.delete();
      }

      return Right(null);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultVoid addPaymentCards({required PaymentCard card}) async {
    try {
      final cardsRef = _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('payment_cards');

      if (card.primaryMethod == true) {
        final primaryCards = await cardsRef
            .where('primaryMethod', isEqualTo: true)
            .get();

        for (final doc in primaryCards.docs) {
          await doc.reference.update({'primaryMethod': false});
        }
      }

      await cardsRef.add(card.toJson());

      return Right(null);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultVoid addSavedAddress({required Address address}) async {
    try {
      final addressesRef = _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('addresses');

      if (address.primaryAddress == true) {
        final primaryAddresses = await addressesRef
            .where('primaryAddress', isEqualTo: true)
            .get();

        for (final doc in primaryAddresses.docs) {
          await doc.reference.update({'primaryAddress': false});
        }
      }

      await addressesRef.add(address.toJson());

      return Right(null);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<CartItem>> updateCartItem({required CartItem item}) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('cart')
          .doc(item.id ?? '-')
          .update({'quantity': item.quantity ?? 0});

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
