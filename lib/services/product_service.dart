import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';
//import '../models/product.dart';

class ProductService {
  final String baseUrl;

  ProductService(this.baseUrl);

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
