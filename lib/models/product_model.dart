class Product {
  final String id;
  final String name;
  final String description;
  final double amount;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.amount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      amount: json['amount'] as double,
    );
  }
}
