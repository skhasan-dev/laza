sealed class LoginEvent {
  const LoginEvent();
}

final class LoginSubmitted extends LoginEvent {
  const LoginSubmitted({required this.username, required this.password});

  final String username;
  final String password;
}

final class LoginRememberMeChanged extends LoginEvent {
  const LoginRememberMeChanged(this.value);

  final bool value;
}
