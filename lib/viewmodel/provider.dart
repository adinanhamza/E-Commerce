import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:onlineshop/model/model.dart';
import 'package:onlineshop/services/service.dart';

class ShoppingProvider extends ChangeNotifier{
final ProductService service = ProductService();
 List <ProductModel> productList = [];
 List <ProductModel>searchedProducts = [];
  bool isSearching= false;
  bool isFavorite = false;


void fetchProducts()async{
  try {
 productList =   await service.getAllProducts();
 searchedProducts = productList;
 if(productList.isNotEmpty){
    log('pro fetching products success');

 }
    notifyListeners();
  } catch (e) {
    log('error in pro fetch products');
  }
}


void searchProducts(String query){
if(query.isEmpty){
  searchedProducts = productList;
  isSearching = false;
}else{
  isSearching = true;
  searchedProducts = productList.where((product)=> product.name.toLowerCase().contains(query.toLowerCase())).toList();
}
notifyListeners();
}

}