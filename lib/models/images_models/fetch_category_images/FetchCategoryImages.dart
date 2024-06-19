class FetchCategoryImagesResponse {
  FetchCategoryImagesResponse({required this.data});

  final List<CategoryImage> data;

  factory FetchCategoryImagesResponse.fromJson(Map<String, dynamic> json) {
    return FetchCategoryImagesResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryImage.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
    );
  }
}

class CategoryImage {
  CategoryImage({
    required this.id,
    required this.imageName,
    required this.price,
    required this.imagePath,
  });

  final int? id;
  final String? imageName;
  final int? price;
  final String? imagePath;

  factory CategoryImage.fromJson(Map<String, dynamic> json) {
    return CategoryImage(
      id: json["id"],
      imageName: json["imageName"],
      price: json["price"],
      imagePath: json["imagePath"],
    );
  }
}
