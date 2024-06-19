class VerifyOTPScreenResponse {
  final bool success;
  final String? message;

  VerifyOTPScreenResponse({required this.success, this.message});

  factory VerifyOTPScreenResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOTPScreenResponse(
      success: json['success'],
      message: json['message'],
    );
  }
}