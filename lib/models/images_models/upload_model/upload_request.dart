class UploadImageRequest {
  final String category;
  final String imageName;
  final double price;
  final String description;
  final String location;

  UploadImageRequest({
    required this.category,
    required this.imageName,
    required this.price,
    required this.description,
    required this.location,
  });

  Map<String, dynamic> toJson() => {
    'caterogy': category,
    'imageName': imageName,
    'price': price,
    'description': description,
    'location': location,
  };
}
