class MakeOrderResponse {
  MakeOrderResponse({
    required this.message,
    required this.success,
  });

  final String? message;
  final bool? success;

  factory MakeOrderResponse.fromJson(Map<String, dynamic> json) {
    return MakeOrderResponse(
      message: json["message"],
      success: json["success"],
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
  };
}