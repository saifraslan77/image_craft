class DeleteImageFromCartResponse {
  DeleteImageFromCartResponse({
    required this.message,
  });

  final String? message;

  factory DeleteImageFromCartResponse.fromJson(Map<String, dynamic> json) {
    return DeleteImageFromCartResponse(
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
