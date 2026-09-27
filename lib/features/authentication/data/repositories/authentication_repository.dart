import 'package:laza/core/index.dart' show AuthUser, ResultFuture;

abstract class AuthenticationRepository {
  ResultFuture<AuthUser?> register({
    required String username,
    required String email,
    required String password,
  });

  ResultFuture<AuthUser?> login({
    required String username,
    required String password,
  });

  ResultFuture<bool> checkForUsername({required String username});
}
