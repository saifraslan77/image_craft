class Item {
  String title;
  String imagePath;

  Item(
      {required this.title,
        required this.imagePath});

  static List<Item> getCategories() {
    return [
      Item(
          title: "Baby Boy \nL.E 180",
          imagePath: "assets/baby1.png"),
      Item(
          title: "Pretty Dog \nL.E 100",
          imagePath: "assets/dog1.png"),
      Item(
          title: "Blue Car \nL.E 120",
          imagePath: "assets/car1.png"),
      Item(
          title: "White Chair \nL.E 110",
          imagePath: "assets/chair.png"),

    ];
  }

}