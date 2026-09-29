import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laza/core/index.dart'
    show FirebaseCollections, APIException, AuthUser, ResultFuture;

import 'profile_data_source.dart';

class ProfileDataSourceImpl implements ProfileDataSource {
  const ProfileDataSourceImpl({
    required this._firebaseAuth,
    required this._firebaseFirestore,
  });

  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  @override
  ResultFuture<AuthUser> updateUserProfile({required AuthUser user}) async {
    try {
      await _firebaseFirestore
          .collection(FirebaseCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .set(user.toJson());

      return Right(user);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<AuthUser> getUserProfile() async {
    try {
      final userSnapshot = await _firebaseFirestore
          .collection(FirebaseCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .get();

      final user = AuthUser.fromJson(userSnapshot.data() ?? {});

      return Right(user);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
