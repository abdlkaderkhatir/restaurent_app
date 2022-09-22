


import 'package:get/get.dart';
import 'package:restaurant_app/logic/controllers/cart_controller.dart';
import 'package:restaurant_app/logic/controllers/category_controller.dart';
import 'package:restaurant_app/logic/controllers/product_controller.dart';
import 'package:restaurant_app/logic/controllers/settings_controller.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
    Get.put(SettingsController());
  }

}