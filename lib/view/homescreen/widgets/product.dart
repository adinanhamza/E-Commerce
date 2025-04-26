
// Then add these new widgets after your CategoryList class
import 'package:flutter/material.dart';
import 'package:onlineshop/view/details/detailpage.dart';


class ProductGrid extends StatelessWidget {
   ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
  itemCount: demoProducts.length,
  physics: NeverScrollableScrollPhysics(),
  shrinkWrap: true,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.75,
  ),
  itemBuilder: (context, index) {
    final product = demoProducts[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: detailproduct,),
          ),
        );
      },
      child: ProductCard(product: product), // Your product widget
    );
  },
);
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

   ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: Image.network(product.networkImage,fit: BoxFit.cover,)
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
  final String networkImage;
  final bool isFavorite;

   Product({
    required this.name,
    required this.currentPrice,
    required this.originalPrice,
    this.discountPercentage = 0,
    required this.rating,
    required this.reviewCount,
    required this.networkImage,
    this.isFavorite = false,
  });
}
 final detailproduct = {
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
// Demo products data
final List<Product> demoProducts = [
  Product(
    name: 'Apple Watch Series 10',
    currentPrice: 379.99,
    originalPrice: 429.99,
    discountPercentage: 10,
    rating: 4.9,
    reviewCount: 263,
    networkImage: 'https://avatars.mds.yandex.net/get-mpic/13287540/2a00000193ba19b6b33c63affbdf12af8092/orig',
    isFavorite: true,
  ),
  Product(
    name: 'Wireless Headphones',
    currentPrice: 129.99,
    originalPrice: 149.99,
    discountPercentage: 15,
    rating: 4.7,
    reviewCount: 182,
  networkImage: 'https://bsmedia.business-standard.com/_media/bs/img/article/2023-01/11/full/1673428228-5342.jpg',
  ),
  Product(
    name: 'iPhone 16 Pro Max',
    currentPrice: 1099.99,
    originalPrice: 1099.99,
    rating: 4.8,
    reviewCount: 421,
    networkImage: 'https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1725960314/Croma%20Assets/Communication/Mobiles/Images/309754_0_uo2lta.png',
    isFavorite: true,
  ),
  Product(
    name: 'MacBook Air M3',
    currentPrice: 999.99,
    originalPrice: 1199.99,
    discountPercentage: 20,
    rating: 4.9,
    reviewCount: 345,
    networkImage:'https://www.mac-paradise.com/img/1100000273677.jpg',
  ),
  Product(
    name: 'Wireless Charging Pad',
    currentPrice: 39.99,
    originalPrice: 49.99,
    discountPercentage: 20,
    rating: 4.5,
    reviewCount: 128,
    networkImage: 'https://thingsidesire.com/wp-content/uploads/2018/06/Samsung-Qi-Wireless-Charger-Pad1.jpg'
  ),
  Product(
    name: 'Smart Home Speaker',
    currentPrice: 89.99,
    originalPrice: 99.99,
    discountPercentage: 10,
    rating: 4.6,
    reviewCount: 201,
    networkImage: 'https://th.bing.com/th/id/OIP.b5FG5Ajpk7GGcRhRb5FS3gHaFj?w=1200&h=900&rs=1&pid=ImgDetMain',
  ),
];
