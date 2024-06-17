class AddToCartResponse {
  AddToCartResponse({
    required this.success,
  });

  final bool success;

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) {
    return AddToCartResponse(
      success: json["success"],
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
  };
}