import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/models/product.dart';
import 'package:restaurant_app/services/product_service.dart';

class ProductController extends GetxController{
    var productList = <Product>[].obs;
    var favouritesList = <Product>[].obs;
    var isLoading = true.obs;
    var stoarge = GetStorage();


  @override
  void onInit() {
    // TODO: implement onInit
    List? storedShoppings = stoarge.read<List>('isFavouritesList');

    print(storedShoppings);

    if (storedShoppings != null) {
      favouritesList =
          storedShoppings.map((e) => Product.fromJson(e)).toList().obs;
    }
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

  // ***********************************
  // Logic for Favourites Screen

  void manageFavourites(int productId) async {
    var existingIndex =
        favouritesList.indexWhere((element) => element.id == productId);

    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      stoarge.remove("isFavouritesList").then((value) async => await stoarge.write("isFavouritesList", favouritesList));
    } else {
      favouritesList
          .add(productList.firstWhere((element) => element.id == productId));
      await stoarge.write("isFavouritesList", favouritesList);

    }
  }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }

}