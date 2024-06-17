class MakePaymentIntentResponse {
  MakePaymentIntentResponse({
    required this.message,
    required this.err,
  });

  final String? message;
  final String? err;

  factory MakePaymentIntentResponse.fromJson(Map<String, dynamic> json) {
    return MakePaymentIntentResponse(
      message: json["message"],
      err: json["err"],
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "err": err,
  };
}