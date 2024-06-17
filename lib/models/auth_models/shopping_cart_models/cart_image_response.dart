class CartImageResponse {
  CartImageResponse({
    required this.totalPrice,
    required this.images,
  });

  final int? totalPrice;
  final List<Image> images;

  factory CartImageResponse.fromJson(Map<String, dynamic> json){
    return CartImageResponse(
      totalPrice: json["totalPrice"],
      images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "totalPrice": totalPrice,
    "images": images.map((x) => x.toJson()).toList(),
  };

}

class Image {
  Image({
    required this.id,
    required this.price,
    required this.imageName,
    required this.imagePath,
  });

  final int? id;
  final int? price;
  final String? imageName;
  final String? imagePath;

  factory Image.fromJson(Map<String, dynamic> json){
    return Image(
      id: json["id"],
      price: json["price"],
      imageName: json["imageName"],
      imagePath: json["imagePath"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "imageName": imageName,
    "imagePath": imagePath,
  };
}