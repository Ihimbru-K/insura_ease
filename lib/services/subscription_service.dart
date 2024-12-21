import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/subscription_model.dart';

class SubscriptionService {
  final String baseUrl;

  SubscriptionService(this.baseUrl);

  Future<void> createSubscription(String productId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/subscriptions'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'productId': productId,
        'userId': 'mock-user-id', // Replace with actual user ID if available
        'startDate': DateTime.now().toIso8601String(),
        'endDate': DateTime.now().add(const Duration(days: 365)).toIso8601String(),
        'totalAmount': 100.0, // Replace with dynamic amount if needed
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create subscription');
    }
  }

  Future<List<Subscription>> fetchSubscriptions() async {
    final response = await http.get(Uri.parse('$baseUrl/subscriptions?userId=mock-user-id'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Subscription.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load subscriptions');
    }
  }



}
