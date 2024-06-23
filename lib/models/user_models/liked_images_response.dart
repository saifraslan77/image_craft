import 'image_model.dart';

class LikedImagesResponse {
  final List<ImageModel> data;

  LikedImagesResponse({required this.data});

  factory LikedImagesResponse.fromJson(Map<String, dynamic> json) {
    return LikedImagesResponse(
      data: (json['data'] as List)
          .map((i) => ImageModel.fromJson(i))
          .toList(),
    );
  }
}