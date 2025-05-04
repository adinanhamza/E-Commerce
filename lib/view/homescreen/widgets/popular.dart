import 'package:flutter/material.dart';

// Popular Brands Widget with Images

class PopularBrandsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> brands = [
    {
      'name': 'Nike', 
      'logo': 'assets/brands/brand-nike.png',
      'color': Colors.white
    },
    {
      'name': 'Adidas', 
      'logo': 'assets/brands/brand-adidas.png',
      'color': Colors.white
    },
    {
      'name': 'Puma', 
      'logo': 'assets/brands/brand-puma-4.png',
      'color': Colors.white
    },
    {
      'name': 'Apple', 
      'logo': 'assets/brands/brand-apple-4.png',
      'color': Colors.white
    },
    {
      'name': 'Samsung', 
      'logo': 'assets/brands/brand-samsung-5.webp',
      'color': Colors.white
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Brands',
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
        SizedBox(
          height: 100,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: brands.length,
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: brands[index]['color'],
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // For network images:
Image.asset(
  brands[index]['logo'],
  height: 60,
  width: 60,
  fit: BoxFit.contain,
  errorBuilder: (context, error, stackTrace) {
    return Center(
      child: Icon(Icons.image_not_supported, size: 30, color: Colors.grey),
    );
  },
),

                    SizedBox(height: 5),
                    Text(
                      brands[index]['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}