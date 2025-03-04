class Product {
  final int? id;
  final String name;
  final double price;

  Product({this.id, required this.name, required this.price});

  // Convert a Dart object to a Map (for SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
  // Convert a Map (from SQLite) to a Dart object
  //Named Factory Constructor
   factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price'],

    );
  }
}

