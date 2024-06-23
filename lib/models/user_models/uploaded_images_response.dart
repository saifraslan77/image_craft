import 'image_model.dart';

class UploadedImagesResponse {
  final List<ImageModel> data;

  UploadedImagesResponse({required this.data});

  factory UploadedImagesResponse.fromJson(Map<String, dynamic> json) {
    return UploadedImagesResponse(
      data: (json['data'] as List)
          .map((i) => ImageModel.fromJson(i))
          .toList(),
    );
  }
}