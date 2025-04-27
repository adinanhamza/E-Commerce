// Special Offers Widget with Images
import 'package:flutter/material.dart';

class SpecialOffersWidget extends StatelessWidget {
  // Sample list of special offers with image URLs
  final List<Map<String, dynamic>> specialOffers = [
    {
      'title': 'Special Deal 1',
      'discount': '25% OFF',
      'image': 'assets/images/offer1.jpg',
      'description': 'Limited time offer'
    },
    {
      'title': 'Special Deal 2',
      'discount': '30% OFF',
      'image': 'assets/images/offer2.jpg',
      'description': 'Flash sale'
    },
    {
      'title': 'Special Deal 3',
      'discount': '15% OFF',
      'image': 'assets/images/offer3.jpg',
      'description': 'Weekend special'
    },
    {
      'title': 'Special Deal 4',
      'discount': '40% OFF',
      'image': 'assets/images/offer4.jpg',
      'description': 'New arrival discount'
    },
    {
      'title': 'Special Deal 5',
      'discount': '20% OFF',
      'image': 'assets/images/offer5.jpg',
      'description': 'Seasonal offer'
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
                'Special Offers',
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
          height: 180,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: specialOffers.length,
            itemBuilder: (context, index) {
              return Container(
                width: 280,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      // Image covering the entire container
                      Positioned.fill(
                        child: // For network images:
Image.network(
  'https://via.placeholder.com/280x180?text=Offer+${index+1}',
  fit: BoxFit.cover,
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(child: CircularProgressIndicator());
  },
  errorBuilder: (context, error, stackTrace) {
    return Center(
      child: Icon(Icons.shopping_bag_outlined, size: 40, color: Colors.grey),
    );
  },
),
                      ),
                      // Semi-transparent overlay for better text visibility
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.1),
                                Colors.black.withOpacity(0.5),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Discount tag
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            specialOffers[index]['discount'],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // Offer title and description
                      Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              specialOffers[index]['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              specialOffers[index]['description'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}