import 'image_model.dart';

class OrderedImagesResponse {
  final List<ImageModel> data;

  OrderedImagesResponse({required this.data});

  factory OrderedImagesResponse.fromJson(Map<String, dynamic> json) {
    return OrderedImagesResponse(
      data: (json['data'] as List)
          .map((i) => ImageModel.fromJson(i))
          .toList(),
    );
  }
}