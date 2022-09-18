

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/models/product.dart';
import 'package:restaurant_app/services/product_service.dart';

class ProductController extends GetxController{
    var productList = <Product>[].obs;
    var isLoading = true.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    getProducts();
    super.onInit();
  }



  void getProducts() async {
    var products = await ProductService.getProducts();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

 
}