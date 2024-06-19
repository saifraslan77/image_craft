class Item {
  final int id;
  final String imageName;
  final int price;
  final String imagePath;

  Item({
    required this.id,
    required this.imageName,
    required this.price,
    required this.imagePath,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      imageName: json['imageName'],
      price: json['price'],
      imagePath: json['imagePath'],
    );
  }
}
