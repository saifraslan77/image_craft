class AddToCartRequest {
  final String imageId;

  AddToCartRequest({required this.imageId});

  Map<String, dynamic> toJson() => {
    "imageId": imageId
  };

  factory AddToCartRequest.fromJson(Map<String, dynamic> json) {
    return AddToCartRequest(
      imageId: json['imageId'],
    );
  }
}