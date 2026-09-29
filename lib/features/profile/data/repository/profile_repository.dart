import 'package:laza/core/index.dart' show AuthUser, ResultFuture;

abstract class ProfileRepository {
  ResultFuture<AuthUser> updateUserProfile({required AuthUser user});

  ResultFuture<AuthUser> getUserProfile();
}
