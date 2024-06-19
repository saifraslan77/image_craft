class DeleteImageFromCartRequest {
  final String imageId;

  DeleteImageFromCartRequest({required this.imageId});

  Map<String, dynamic> toJson() => {
    "imageId": imageId
  };

  factory DeleteImageFromCartRequest.fromJson(Map<String, dynamic> json) {
    return DeleteImageFromCartRequest(
      imageId: json['imageId'],
    );
  }
}