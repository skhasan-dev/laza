part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class AuthSubmitted extends AuthEvent {
  const AuthSubmitted();
}
