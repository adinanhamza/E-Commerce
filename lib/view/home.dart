import 'package:flutter/material.dart';


// Home Screen with categories and promotion banner
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(

              padding: EdgeInsets.all(16.0),
              child: DeliveryAddressWidget(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const PromotionBanner(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See all'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const CategoryList(),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined),
        const SizedBox(width: 8),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Delivery address'),
            Row(
              children: [
                Text(
                  '7491 Elm Street, Springfield',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),
        const Spacer(),
        Stack(
          alignment: Alignment.topRight,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fashion sale up to 25% off!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Get a special offer from our featured fashion products starts today',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Shop now'),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/fashion_model.png',
            width: 100,
            height: 100,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 100,
              height: 100,
              color: Colors.grey[300],
              child: const Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'All', 'icon': Icons.apps},
      {'name': 'Fashion', 'icon': Icons.checkroom},
      {'name': 'Phones', 'icon': Icons.phone_android},
      {'name': 'Laptops', 'icon': Icons.laptop},
    ];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isFirst = index == 0;
          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isFirst ? Colors.black : Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    categories[index]['icon'] as IconData,
                    color: isFirst ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(categories[index]['name'] as String),
              ],
            ),
          );
        },
      ),
    );
  }
}


