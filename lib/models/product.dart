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
}
