class MakeOrderResponse {
  MakeOrderResponse({
    required this.message,
    required this.err,
  });

  final String? message;
  final String? err;

  factory MakeOrderResponse.fromJson(Map<String, dynamic> json) {
    return MakeOrderResponse(
      message: json["message"],
      err: json["err"],
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "err": err,
  };
}