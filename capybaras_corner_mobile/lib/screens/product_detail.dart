import 'package:flutter/material.dart';
import 'package:capybaras_corner_mobile/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name, style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text("Harga: ${product.fields.price}"),
            const SizedBox(height: 16),
            Text("Deskripsi: ${product.fields.description}"),
            const SizedBox(height: 16),
            Text("Chill level: ${product.fields.chillLevel}"),
          ],
        ),
      ),
    );
  }
}
