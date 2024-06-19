class ImageDetails {
  final int? height;
  final int? width;
  final String? type;
  final DateTime? uploadDate;
  final String? location;
  final String? category;

  ImageDetails({
     this.height,
     this.width,
     this.type,
     this.uploadDate,
     this.location,
     this.category,
  });

  factory ImageDetails.fromJson(Map<String, dynamic> json) {
    return ImageDetails(
      height: json['height'],
      width: json['width'],
      type: json['type'],
      uploadDate: DateTime.parse(json['uploadDate']),
      location: json['location'],
      category: json['category'],
    );
  }
}

class ImageData {
  final String? name;
  final int? price;
  final String? path;
  final String? description;
  final int? noOfLikes;

  ImageData({
     this.name,
     this.price,
     this.path,
     this.description,
     this.noOfLikes,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      name: json['name'],
      price: json['price'],
      path: json['path'],
      description: json['description'],
      noOfLikes: json['noOfLikes'],
    );
  }
}

class CarImage {
  final ImageDetails imageDetails;
  final ImageData imageData;

  CarImage({
    required this.imageDetails,
    required this.imageData,
  });

  factory CarImage.fromJson(Map<String, dynamic> json) {
    return CarImage(
      imageDetails: ImageDetails.fromJson(json['imageDetails']),
      imageData: ImageData.fromJson(json['imageData']),
    );
  }
}
