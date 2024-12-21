import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/subscription_model.dart';

class SubscriptionProvider with ChangeNotifier {
  List<Subscription> _subscriptions = [];

  List<Subscription> get subscriptions => _subscriptions;

  Future<void> fetchSubscriptions() async {
    try {
      final response = await http.get(Uri.parse('<your-subscriptions-endpoint>'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _subscriptions = data.map((item) => Subscription.fromJson(item)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to fetch subscriptions');
      }
    } catch (error) {
      print('Error fetching subscriptions: $error');
    }
  }
}





// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../models/subscription_model.dart';
// import '../utils/api_endpoints.dart';
//
// class SubscriptionProvider with ChangeNotifier {
//   List<Subscription> _subscriptions = [];
//
//   List<Subscription> get subscriptions => _subscriptions;
//
//   Future<void> fetchSubscriptions() async {
//     try {
//       final response = await http.get(Uri.parse(subscriptionsEndpoint));
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         _subscriptions = data.map((item) => Subscription.fromJson(item)).toList();
//         notifyListeners();
//       } else {
//         throw Exception('Failed to load subscriptions');
//       }
//     } catch (error) {
//       rethrow;
//     }
//   }
// }
