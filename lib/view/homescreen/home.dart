import 'package:flutter/material.dart';
import 'package:onlineshop/view/homescreen/widgets/banner.dart';
import 'package:onlineshop/view/homescreen/widgets/category.dart';
import 'package:onlineshop/view/homescreen/widgets/deliveryadrs.dart';
import 'package:onlineshop/view/homescreen/widgets/offer.dart';
import 'package:onlineshop/view/homescreen/widgets/popular.dart';
import 'package:onlineshop/view/homescreen/widgets/product.dart';
import 'package:onlineshop/view/homescreen/widgets/recommended.dart';
import 'package:onlineshop/view/homescreen/widgets/searchbar.dart';
import 'package:onlineshop/viewmodel/provider.dart';
import 'package:provider/provider.dart';

// Home Screen with categories and promotion banner
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

   TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   final provider = Provider.of<ShoppingProvider>(context,listen: false);
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
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SearchBarWithResults(controller: searchController),
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
 SizedBox(height: 20),
 SpecialOffersWidget(),
  SizedBox(height: 20),
  PopularBrandsWidget(),
SizedBox(height: 20),
RecommendedProductsWidget(),
SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

