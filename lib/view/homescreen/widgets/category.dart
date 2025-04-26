

import 'package:flutter/material.dart';

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




