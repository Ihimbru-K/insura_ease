class Subscription {
  final String id;
  final String productId;
  final String userId;
  final DateTime startDate;
  final DateTime endDate;
  final double totalAmount;

  Subscription({
    required this.id,
    required this.productId,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.totalAmount,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'] as String,
      productId: json['productId'] as String,
      userId: json['userId'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      totalAmount: json['totalAmount'] as double,
    );
  }
}
