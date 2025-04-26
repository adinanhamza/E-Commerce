
import 'package:flutter/material.dart';
import 'package:onlineshop/view/profile.dart';

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
            'assets/images/fashion_model.png' ,
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




