class Bouquet {
  final String name;
  final double price;
  final String image;
  final String description;
  int quantity;
  int likes;
  int loves;

  Bouquet({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    this.quantity = 1,
    this.likes = 0,
    this.loves = 0,
  });
}