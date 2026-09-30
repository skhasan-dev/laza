import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:laza/core/index.dart'
    show APIException, AuthUser, FirebaseCollections, ResultFuture, ResultVoid;
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

      await credential.user?.sendEmailVerification();

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
    } on FirebaseAuthException catch (e) {
      return Left(APIException(message: e.message, statusCode: 500));
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
          APIException(message: 'Username not found!!', statusCode: 404),
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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return Left(
          APIException(message: 'Incorrect Password !!', statusCode: 500),
        );
      }
      return Left(APIException(message: e.message, statusCode: 500));
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

  @override
  ResultVoid sendPasswordResetLink({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);

      return Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(APIException(message: e.message, statusCode: 500));
    } catch (e, s) {
      log('$e\n$s');
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<AuthUser?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );

      final firebaseUser = userCredential.user;

      if (firebaseUser == null) {
        return const Right(null);
      }

      final user = AuthUser(
        username: firebaseUser.displayName ?? '',
        email: firebaseUser.email ?? '',
        password: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Create the Firestore user document only for a new user.
      if (userCredential.additionalUserInfo?.isNewUser ?? false) {
        await _firebaseFirestore
            .collection(FirebaseCollections.users)
            .doc(firebaseUser.uid)
            .set(user.toJson());
      }

      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(APIException(message: e.message, statusCode: 500));
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
