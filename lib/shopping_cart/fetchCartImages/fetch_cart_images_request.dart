class FetchCartImagesRequest {
  final String token;

  FetchCartImagesRequest({required this.token});

  Map<String, dynamic> toJson() => {
    "token": token,
  };

  factory FetchCartImagesRequest.fromJson(Map<String, dynamic> json) {
    return FetchCartImagesRequest(
      token: json['token'],
    );
  }
}
