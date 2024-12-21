import 'package:flutter/material.dart';

import '../../models/product_model.dart';


class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(product.name),
        subtitle: Text(product.description),
        trailing: Text('\$${product.amount}'),
      ),
    );
  }
}
