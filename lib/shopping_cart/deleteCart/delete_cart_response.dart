class DeleteCartResponse {
  DeleteCartResponse({
    required this.message,
  });

  final String? message;

  factory DeleteCartResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCartResponse(
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
