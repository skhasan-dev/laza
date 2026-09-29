import 'package:laza/core/index.dart';

sealed class RegisterState {
  const RegisterState();
}

final class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

final class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

final class RegisterSuccess extends RegisterState {
  const RegisterSuccess({required this.notAvailable});
  final bool notAvailable;
}

final class RegisterFailure extends RegisterState {
  const RegisterFailure({required this.failure});

  final Failure? failure;
}
