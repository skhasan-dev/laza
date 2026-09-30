import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/core/index.dart' show AuthUser, RouteNames, getIt;
import 'package:laza/features/profile/index.dart' show ProfileRepository;

class AppStateProvider {
  AppStateProvider({
    required this._firebaseAuth,
    required this._profileRepository,
  });

  final FirebaseAuth _firebaseAuth;
  final ProfileRepository _profileRepository;

  AuthUser? _user;
  AuthUser? get user => _user;
  set user(AuthUser? user) {
    _user = user;
  }

  bool get isLoggedIn => _firebaseAuth.currentUser != null;
  bool get isProfileCompleted => isLoggedIn && _user != null;

  bool get emailVerified => _firebaseAuth.currentUser?.emailVerified ?? false;

  Future<(bool, bool)> init() async {
    if (!isLoggedIn) return (false, false);

    final result = await _profileRepository.getUserProfile();

    result.fold((e) => (true, false), (user) {
      _user = user;
      return (true, true);
    });

    return (isLoggedIn, isProfileCompleted);
  }

  Future<void> logout(BuildContext context) async {
    await getIt<FirebaseAuth>().signOut();
    context.goNamed(RouteNames.auth);
  }
}
