import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _selectedColorIndex = 0;
  int _quantity = 1;
  bool _isFavorited = false;

  final List<Map<String, dynamic>> colors = [
    {'name': 'Grey', 'color': Colors.grey},
    {'name': 'Blue', 'color': Colors.indigo},
    {'name': 'Green', 'color': Colors.lightGreen},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(_isFavorited ? Icons.bookmark : Icons.bookmark_outline),
            onPressed: () {
              setState(() {
                _isFavorited = !_isFavorited;
              });
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image with Discount Badge
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        color: Colors.grey[100],
                        child: Hero(
                          tag: 'product-${widget.product['id']}',
                          child: Icon(
                            widget.product['icon'] ?? Icons.watch,
                            size: 150,
                            color: colors[_selectedColorIndex]['color'],
                          ),
                        ),
                      ),
                      if ((widget.product['discount'] ?? 0) > 0)
                        Positioned(
                          top: 16,
                          right: 16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.pink[100],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '${widget.product['discount']}% off',
                              style: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      // Image navigation indicators
                      Positioned(
                        bottom: 16,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (index) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: index == 1 ? 24 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: index == 1 ? Colors.black : Colors.grey[300],
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  // Product Info Section
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Name and Favorite button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                widget.product['name'] ?? 'Apple Watch Series 10',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                _isFavorited ? Icons.bookmark : Icons.bookmark_outline,
                                color: _isFavorited ? Colors.black : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isFavorited = !_isFavorited;
                                });
                              },
                            ),
                          ],
                        ),
                        
                        // Price Section
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              '\$${widget.product['price']?.toStringAsFixed(2) ?? '379.99'}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 12),
                            if ((widget.product['discount'] ?? 0) > 0)
                              Text(
                                '\$${widget.product['originalPrice']?.toStringAsFixed(2) ?? '419.99'}',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 16,
                                ),
                              ),
                          ],
                        ),
                        
                        // Ratings
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 20),
                            Text(
                              ' ${widget.product['rating']?.toString() ?? '4.9'}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              ' (${widget.product['reviews']?.toString() ?? '263'})',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        
                        // Colors Section
                        const SizedBox(height: 24),
                        const Text(
                          'Colors',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: List.generate(
                            colors.length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColorIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 16),
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: _selectedColorIndex == index
                                      ? Border.all(color: Colors.black, width: 2)
                                      : null,
                                ),
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: colors[index]['color'],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                        // Size Section (if applicable)
                        if (widget.product['sizes'] != null) ...[
                          const SizedBox(height: 24),
                          const Text(
                            'Size',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Size options would go here
                        ],
                        
                        // Description Section
                        const SizedBox(height: 24),
                        const Text(
                          'Descriptions',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          widget.product['description'] ?? 
                          'Series 10 is a major milestone for Apple Watch. It features our biggest and most advanced display yet. It delivers more information onscreen than ever before.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                            height: 1.5,
                          ),
                        ),
                        
                        // Specifications Section
                        const SizedBox(height: 24),
                        const Text(
                          'Specifications',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildSpecificationItem('Display', '1.9" AMOLED'),
                        _buildSpecificationItem('Water Resistance', '50m'),
                        _buildSpecificationItem('Battery', 'Up to 18 hours'),
                        _buildSpecificationItem('Connectivity', 'Bluetooth 5.0, Wi-Fi, LTE'),
                        
                        // Reviews Section Preview
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Reviews',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigate to reviews page
                              },
                              child: const Text('See all'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        _buildReviewItem(
                          name: 'John Doe',
                          rating: 5,
                          comment: 'Great watch! The display is amazing and battery life is better than expected.',
                          date: '2 days ago',
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom Action Bar
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Add to cart functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Added to cart'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                    label: const Text('Add to Cart'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Buy now functionality - Navigate to checkout
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DummyCheckoutPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Buy Now'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecificationItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem({
    required String name,
    required int rating,
    required String comment,
    required String date,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 16,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            comment,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

// Dummy checkout page for navigation demonstration
class DummyCheckoutPage extends StatelessWidget {
  const DummyCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: const Center(
        child: Text('Checkout Page'),
      ),
    );
  }
}

// Example usage of the product details page
class ProductDetailExample extends StatelessWidget {
  const ProductDetailExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample product data
    final product = {
      'id': 'apple-watch-series-10',
      'name': 'Apple Watch Series 10',
      'price': 379.99,
      'originalPrice': 419.99,
      'discount': 10,
      'icon': Icons.watch,
      'rating': 4.9,
      'reviews': 263,
      'description': 'Series 10 is a major milestone for Apple Watch. It features our biggest and most advanced display yet. It delivers more information onscreen than ever before. The battery lasts longer than previous generations, and it has enhanced fitness tracking capabilities.',
      'category': 'Electronics',
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          primary: Colors.indigo,
          background: Colors.white,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: ProductDetailsPage(product: product),
    );
  }
}

