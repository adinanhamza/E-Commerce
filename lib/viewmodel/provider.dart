import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:onlineshop/model/model.dart';
import 'package:onlineshop/services/service.dart';

class ShoppingProvider extends ChangeNotifier{
final shoppingService service = shoppingService();
 List <ProductModel> productList = [];


void fetchProducts()async{
  try {
 productList =   await service.getAllProducts();
    log('pro fetching products success');
    notifyListeners();
  } catch (e) {
    log('error in pro fetch products');
  }
}

}