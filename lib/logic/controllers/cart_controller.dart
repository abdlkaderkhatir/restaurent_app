import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/models/product.dart';
import 'package:restaurant_app/routes/routes.dart';
import 'package:restaurant_app/utils/theme.dart';

class CartController extends GetxController{

     var productsMap = {}.obs;

  // void addProductToCart(Product productModels) {
  //   if (productsMap.containsKey(productModels)) {
  //     productsMap[productModels] += 1;
  //     // print(productsMap.entries);
  //     // print (productsMap.keys.toList());
  //     print (productsMap.toString());

  //   } else {
  //     productsMap[productModels] = 1;
  //     // print(productsMap.entries);
  //     // print(productsMap.entries);
  //     print (productsMap.toString());
      

  //   }
  // }




  void addProductToCart(Product productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
       Get.snackbar(
                      'product: ${productModels.title} updated to cart',
                      'Successfully updated',
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: pinkClr
                  );
      
    } else {
      productsMap[productModels] = 1;
       Get.snackbar(
                      'product: ${productModels.title} added to cart',
                      'Successfully added',
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: mainColor
                  );
    }
  }

  void removeProductsFarmCart(Product productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }

    
  }

  void removeOneProduct(Product productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {
      Get.defaultDialog(
      title: "Clean Products",
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need clear products',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: " No ",
      cancelTextColor: Colors.white,
      textConfirm: " YES ",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);


   int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }

 
}