import 'package:flutter/material.dart';
import 'package:onlineshop/view/profile.dart';


// Home Screen with categories and promotion banner
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Home'),
        actions: [
          IconButton(
            icon:  Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon:  Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
          
                padding: EdgeInsets.all(16.0),
                child: DeliveryAddressWidget(),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search products...',
                    prefixIcon:  Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
               SizedBox(height: 20),
               PromotionBanner(),
               SizedBox(height: 20),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child:  Text('See all'),
                    ),
                  ],
                ),
              ),
               SizedBox(height: 10),
               CategoryList(),
               SizedBox(height: 20,),
               
// Add this to your HomeScreen widget's Column children after the CategoryList
 SizedBox(height: 24),
Padding(
  padding:  EdgeInsets.symmetric(horizontal: 16.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Featured Products',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextButton(
        onPressed: () {},
        child: Text('See all'),
      ),
    ],
  ),
),
 SizedBox(height: 10),
 Expanded(
  child: ProductGrid(),
),

            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryAddressWidget extends StatelessWidget {
   DeliveryAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Icon(Icons.location_on_outlined),
         SizedBox(),
         Column(
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
         Spacer(),
        Stack(
          alignment: Alignment.topRight,
          children: [
            IconButton(
              onPressed: () {},
              icon:  Icon(Icons.notifications_outlined),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 8,
                height: 8,
                decoration:  BoxDecoration(
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
   PromotionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 16),
      padding:  EdgeInsets.all(16),
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
                 Text(
                  'Fashion sale up to 25% off!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
           SizedBox(height: 8),
                 Text(
                  'Get a special offer from our featured fashion products starts today',
                  style: TextStyle(color: Colors.white70),
                ),
                 SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child:  Text('Shop now'),
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
              child:  Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
   CategoryList({super.key});

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
        padding:  EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isFirst = index == 0;
          return Container(
            margin:  EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                  padding:  EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isFirst ? Colors.black : Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    categories[index]['icon'] as IconData,
                    color: isFirst ? Colors.white : Colors.black,
                  ),
                ),
                 SizedBox(height: 4),
                Text(categories[index]['name'] as String),
              ],
            ),
          );
        },
      ),
    );
  }
}






// Then add these new widgets after your CategoryList class

class ProductGrid extends StatelessWidget {
   ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding:  EdgeInsets.all(16),
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: demoProducts.length,
      itemBuilder: (context, index) {
        return ProductCard(product: demoProducts[index]);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

   ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset:  Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      product.icon,
                      size: 60,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                if (product.discountPercentage > 0)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${product.discountPercentage}% off',
                        style:  TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding:  EdgeInsets.all(4),
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      product.isFavorite
                          ? Icons.bookmark
                          : Icons.bookmark_outline,
                      size: 18,
                      color: product.isFavorite ? Colors.pink : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                   SizedBox(height: 4),
                  Row(
                    children: [
                       Icon(Icons.star, color: Colors.amber, size: 14),
                      Text(
                        ' ${product.rating}',
                        style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        ' (${product.reviewCount})',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '\$${product.currentPrice.toStringAsFixed(2)}',
                        style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                       SizedBox(width: 4),
                      if (product.originalPrice > product.currentPrice)
                        Text(
                          '\$${product.originalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.grey[500],
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double currentPrice;
  final double originalPrice;
  final int discountPercentage;
  final double rating;
  final int reviewCount;
  final IconData icon;
  final bool isFavorite;

   Product({
    required this.name,
    required this.currentPrice,
    required this.originalPrice,
    this.discountPercentage = 0,
    required this.rating,
    required this.reviewCount,
    required this.icon,
    this.isFavorite = false,
  });
}

// Demo products data
final List<Product> demoProducts = [
  Product(
    name: 'Apple Watch Series 10',
    currentPrice: 379.99,
    originalPrice: 429.99,
    discountPercentage: 10,
    rating: 4.9,
    reviewCount: 263,
    icon: Icons.watch,
    isFavorite: true,
  ),
  Product(
    name: 'Wireless Headphones',
    currentPrice: 129.99,
    originalPrice: 149.99,
    discountPercentage: 15,
    rating: 4.7,
    reviewCount: 182,
    icon: Icons.headphones,
  ),
  Product(
    name: 'iPhone 16 Pro Max',
    currentPrice: 1099.99,
    originalPrice: 1099.99,
    rating: 4.8,
    reviewCount: 421,
    icon: Icons.phone_iphone,
    isFavorite: true,
  ),
  Product(
    name: 'MacBook Air M3',
    currentPrice: 999.99,
    originalPrice: 1199.99,
    discountPercentage: 20,
    rating: 4.9,
    reviewCount: 345,
    icon: Icons.laptop_mac,
  ),
  Product(
    name: 'Wireless Charging Pad',
    currentPrice: 39.99,
    originalPrice: 49.99,
    discountPercentage: 20,
    rating: 4.5,
    reviewCount: 128,
    icon: Icons.charging_station,
  ),
  Product(
    name: 'Smart Home Speaker',
    currentPrice: 89.99,
    originalPrice: 99.99,
    discountPercentage: 10,
    rating: 4.6,
    reviewCount: 201,
    icon: Icons.speaker,
  ),
];
