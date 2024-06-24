class DeleteImageFromCartResponse {
  final String message;

  DeleteImageFromCartResponse({required this.message});

  factory DeleteImageFromCartResponse.fromJson(Map<String, dynamic> json) {
    return DeleteImageFromCartResponse(
      message: json['message'],
    );
  }

  @override
  String toString() {
    return 'DeleteImageFromCartResponse{message: $message}';
  }
}
