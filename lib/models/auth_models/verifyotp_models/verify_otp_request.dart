class VerifyOTPScreenRequest {
  final String email;
  final String otp;

  VerifyOTPScreenRequest({required this.email, required this.otp});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otp': otp,
    };
  }
}
