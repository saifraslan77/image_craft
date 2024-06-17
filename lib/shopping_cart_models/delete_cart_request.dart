class DeleteCartRequest {
  final String token;

  DeleteCartRequest({required this.token});

  Map<String, dynamic> toJson() => {
    "token": token,
  };

  factory DeleteCartRequest.fromJson(Map<String, dynamic> json) {
    return DeleteCartRequest(
      token: json['token'],
    );
  }
}
