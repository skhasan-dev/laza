import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laza/core/index.dart'
    show APIException, AuthUser, FirebaseCollections, ResultFuture;
import 'package:laza/features/authentication/index.dart'
    show AuthenticationDatasource;

class AuthenticationDatasourceImpl implements AuthenticationDatasource {
  const AuthenticationDatasourceImpl({
    required this._firebaseAuth,
    required this._firebaseFirestore,
  });

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  @override
  ResultFuture<AuthUser?> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = AuthUser(
        username: username,
        email: email,
        password: password,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _firebaseFirestore
          .collection(FirebaseCollections.users)
          .doc(credential.user!.uid)
          .set(user.toJson());

      return Right(user);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<AuthUser?> login({
    required String username,
    required String password,
  }) async {
    try {
      final snapshot = await _firebaseFirestore
          .collection(FirebaseCollections.users)
          .where('username', isEqualTo: username)
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        return Left(
          APIException(message: 'Invalid username ', statusCode: 403),
        );
      }

      final userData = snapshot.docs.first.data();
      final email = userData['email'] as String;

      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        return Left(
          APIException(message: 'Unable to authenticate user', statusCode: 404),
        );
      }

      return Right(AuthUser.fromJson(userData));
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<bool> checkForUsername({required String username}) async {
    try {
      final snapshot = await _firebaseFirestore
          .collection(FirebaseCollections.users)
          .where('username', isEqualTo: username)
          .limit(1)
          .get();

      return Right(snapshot.docs.isNotEmpty);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
