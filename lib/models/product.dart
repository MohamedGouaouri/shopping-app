class Product {
  int id;
  String name;
  double price;
  double rate;
  int number;
  String description;
  String? pathToimage;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.rate,
      required this.description,
      required this.number});

  /// Loads API product to Dart client product model
  static Product loadApiProduct(Map apiProduct) {
    return Product(
        id: apiProduct['id'],
        name: apiProduct['title'],
        price: apiProduct['price'],
        rate: apiProduct['rating'],
        description: apiProduct['description'],
        number: apiProduct['quantity']);
  }
}
