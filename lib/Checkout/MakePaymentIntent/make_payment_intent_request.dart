class MakePaymentIntentRequest {
  final int amount;
  final String currency;

  MakePaymentIntentRequest({required this.amount, required this.currency});

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currency": currency,
  };

  factory MakePaymentIntentRequest.fromJson(Map<String, dynamic> json) {
    return MakePaymentIntentRequest(
      amount: json['amount'],
      currency: json['currency'],
    );
  }
}
