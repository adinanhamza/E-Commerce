import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlineshop/model/model.dart';

class ProductService{
  final CollectionReference firebaseData = FirebaseFirestore.instance.collection('products');

  Future<List<ProductModel>>getAllProducts()async{
   try {
      final QuerySnapshot snapshot =await firebaseData.get();
    log('product data get successfully');
    return snapshot.docs.map((doc)=> ProductModel.fromDataBase(doc.data() as Map<String,dynamic>,doc.id)).toList();

   }on FirebaseException catch (e) {
    log('failed to get data : $e');
    throw Exception('error in get product data $e');
   }
  }
}