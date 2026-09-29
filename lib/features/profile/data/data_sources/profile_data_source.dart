import 'package:laza/core/index.dart' show AuthUser, ResultFuture;

abstract class ProfileDataSource {
  ResultFuture<AuthUser> updateUserProfile({required AuthUser user});

  ResultFuture<AuthUser> getUserProfile();
}
