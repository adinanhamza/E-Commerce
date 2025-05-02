import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'name': 'All',
        'image': 'assets/cat-all.webp',
      },
      {
        'name': 'Fashion',
        'image': 'assets/cat-fashion.jpg',
      },
      {
        'name': 'Phones',
        'image': 'assets/cat-phones.webp',
      },
      {
        'name': 'Laptops',
        'image': 'assets/cat-laps.jpg',
      },
      {
        'name': 'Electronics',
        'image': 'assets/cat-electro2.jpeg',
      },
      {
        'name': 'Beauty',
        'image': 'assets/cat-buety.jpg',
      },
      {
        'name': 'Home',
        'image': 'assets/cat-home.jpeg',
      },
      {
        'name': 'Sports',
        'image': 'assets/cat-sport.jpg',
      },
    ];

    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            width: 80,
            margin: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: isSelected
                        ? Border.all(color: Colors.black, width: 2)
                        : null,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    categories[index]['image'] as String,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  categories[index]['name'] as String,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 12,
                    color: isSelected ? Colors.black : Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}