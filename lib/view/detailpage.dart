
// Product Details Screen showing Apple Watch
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          IconButton(
            icon: Icon(Icons.bookmark_outline),
            onPressed: null,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 240,
                width: double.infinity,
                color: Colors.grey[100],
                child: Center(
                  child: Icon(
                    Icons.watch,
                    size: 120,
                    color: Colors.grey[400],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  '10% off',
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Apple Watch Series 10',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.bookmark_outline),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      '\$379.99',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '\$379.99',
                      style: TextStyle(
                        color: Colors.grey[500],
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const Text(
                      ' 4.9',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' (263)',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Colors',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    buildColorOption(Colors.grey, true),
                    buildColorOption(Colors.indigo, false),
                    buildColorOption(Colors.lightGreen, false),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Descriptions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Series 10 is a major milestone for Apple Watch. It features our biggest and most advanced display yet. It delivers more information onscreen than ever before.',
                  style: TextStyle(height: 1.5),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_cart_outlined),
                        label: const Text('Add to Cart'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Buy Now'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildColorOption(Color color, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: isSelected
            ? Border.all(color: Colors.black, width: 2)
            : null,
      ),
    );
  }
}
