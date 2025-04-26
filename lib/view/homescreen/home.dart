import 'package:flutter/material.dart';
import 'package:onlineshop/view/homescreen/widgets/banner.dart';
import 'package:onlineshop/view/homescreen/widgets/category.dart';
import 'package:onlineshop/view/homescreen/widgets/deliveryadrs.dart';
import 'package:onlineshop/view/homescreen/widgets/product.dart';



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
 ProductGrid(),

            ],
          ),
        ),
      ),
    );
  }
}
