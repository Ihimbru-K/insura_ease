import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('<your-products-endpoint>'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _products = data.map((item) => Product.fromJson(item)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (error) {
      print('Error fetching products: $error');
    }
  }
}












// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../models/product_model.dart';
// import '../utils/api_endpoints.dart';
//
// class ProductProvider with ChangeNotifier {
//   List<Product> _products = [];
//
//   List<Product> get products => _products;
//
//   Future<void> fetchProducts() async {
//     try {
//       final response = await http.get(Uri.parse(productsEndpoint));
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         _products = data.map((item) => Product.fromJson(item)).toList();
//         notifyListeners();
//       } else {
//         throw Exception('Failed to load products');
//       }
//     } catch (error) {
//       rethrow;
//     }
//   }
// }
