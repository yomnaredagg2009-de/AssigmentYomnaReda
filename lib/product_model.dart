class Product {
  String name;
  String icon;
  double price;
  int quantity;

  Product({
    required this.name,
    required this.icon,
    required this.price,
    this.quantity = 1,
  });

  double get totalPrice {
    return price * quantity;
  }
}
