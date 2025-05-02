import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop/model/model.dart';

class Addpage extends StatelessWidget {
  const Addpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            try {
              final data =   ProductModel(
    name: 'Google Pixel 7',
    currentPrice: 599.00,
    originalPrice: 699.00,
    discountPercentage: 14,
    rating: 4.5,
    reviewCount: 210,
    networkImage: 'https://gadgetandphone.com/public/uploads/all/nwFH2oSRBRDxl8UhXz4q4Sn56ckcCCsSyNhfTBBn.jpg',
  )
;
              FirebaseFirestore.instance
                  .collection('products')
                  .add(data.toDataBase());
                  log('added to databse ${data.name}');
            } on FirebaseException catch (e) {
              log(e.message.toString());
            }
          },
          child: Text("add data"),
        ),
      ),
    );
  }
}
