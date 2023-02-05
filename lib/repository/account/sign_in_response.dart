class SignInResponse {
  final bool success;
  final String message;
  final String? token;

  SignInResponse({
    required this.success,
    required this.message,
    this.token,
  });
}
