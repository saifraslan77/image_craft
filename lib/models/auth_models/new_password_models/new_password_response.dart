class SetNewPasswordResponse {
  final String message;

  SetNewPasswordResponse({required this.message});

  factory SetNewPasswordResponse.fromJson(Map<String, dynamic> json) {
    return SetNewPasswordResponse(
      message: json['message'],
    );
  }
}
