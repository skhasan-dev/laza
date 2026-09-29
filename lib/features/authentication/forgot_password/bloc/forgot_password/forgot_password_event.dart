sealed class ForgotPasswordEvent {
  const ForgotPasswordEvent();
}

final class ForgotPasswordLinkSent extends ForgotPasswordEvent {
  const ForgotPasswordLinkSent(this.email);
  final String email;
}
