
import 'package:flutter/material.dart';

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
            'assets/home-banner.jpeg' ,
            width: 100,
            height: 100,
            fit: BoxFit.contain,

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