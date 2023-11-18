import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String productName;
  final double productPrice;
  final String productImage;
  final Color color;

  const ProductItem({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productName, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text(
              '\$$productPrice',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            Center(
              child: Image.asset(
                productImage,
                height: 175,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
