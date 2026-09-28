sealed class RegisterEvent {
  const RegisterEvent();
}

final class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted({
    required this.username,
    required this.email,
    required this.password,
  });

  final String username;
  final String email;
  final String password;
}

final class CheckedUsername extends RegisterEvent {
  const CheckedUsername({required this.username});

  final String username;
}
