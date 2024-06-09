class RegisterResponse {
  RegisterResponse({
    this.message,
    this.success,
  });

  final String? message;
  final bool? success;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'success': success,
  };
}
