class ImageModel {
  final int id;
  final String imagePath;

  ImageModel({required this.id, required this.imagePath});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      imagePath: json['imagePath'],
    );
  }
}