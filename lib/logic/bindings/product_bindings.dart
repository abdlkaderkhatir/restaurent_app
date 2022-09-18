


import 'package:get/get.dart';
import 'package:restaurant_app/logic/controllers/product_controller.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.put(ProductController());
  }

}