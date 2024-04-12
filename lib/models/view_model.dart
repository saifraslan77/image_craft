class Screen {
  final String imageprice;
  final String imagetype;
  final String title;
  final String imageUrl;
  final String description;
  final String detailsimage;

  Screen( {required this.title,required this.imagetype,required this.imageprice, required this.imageUrl, required this.description,required this.detailsimage});
}

List<Screen> screens = [
  Screen(
    imagetype: "",
    title: "Child",
    imageprice: "",
    imageUrl: "assets/child.jpeg",
    description: "This screen is about a child",
    detailsimage: "",
  ),
  Screen(
    imagetype: "",
    title: "Dog",
    imageprice: "",
    imageUrl: "assets/dog.jpeg",
    description: "This screen is about a dog",
    detailsimage: "",
  ),
  Screen(
    imagetype: '',
    title: "Chair",
    imageprice: '',
    imageUrl: "assets/chair.jpeg",
    description: "This screen is about a chair",
    detailsimage: "",
  ),
];
