import 'package:flutter/material.dart';
import 'package:onlineshop/view/bottombar/bottom.dart';



void main() {
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          primary: Colors.indigo,
          background: Colors.white,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home:BottomScreen());
  
  }
}