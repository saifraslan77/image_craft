class ResetPasswordResponse {
  ResetPasswordResponse({
    required this.message,
  });

  final String message;

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponse(
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
