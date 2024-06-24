class MakePaymentIntentResponse {
  MakePaymentIntentResponse({
    required this.message,
    required this.success,
  });

  final String? message;
  final bool success;

  factory MakePaymentIntentResponse.fromJson(Map<String, dynamic> json) {
    return MakePaymentIntentResponse(
      message: json["message"],
      success: json["success"],
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
  };
}