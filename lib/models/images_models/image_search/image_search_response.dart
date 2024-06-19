// models/images_models/search_image/search_image_response.dart

class SearchImageResponse {
  SearchImageResponse({
    required this.images,
  });

  final List<ImagesOfSearch> images;

  factory SearchImageResponse.fromJson(Map<String, dynamic> json) {
    return SearchImageResponse(
      images: json["data"] == null ? [] : List<ImagesOfSearch>.from(json["data"]!.map((x) => ImagesOfSearch.fromJson(x))),
    );
  }
}

class ImagesOfSearch {
  ImagesOfSearch({
    required this.id,
    required this.imageName,
    required this.price,
    required this.imagePath,
  });

  final int? id;
  final String? imageName;
  final int? price;
  final String? imagePath;

  factory ImagesOfSearch.fromJson(Map<String, dynamic> json) {
    return ImagesOfSearch(
      id: json["id"],
      imageName: json["imageName"],
      price: json["price"],
      imagePath: json["imagePath"],
    );
  }
}
