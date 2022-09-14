

import 'package:get/get.dart';
import 'package:restaurant_app/logic/controllers/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.put(AuthController());
  }

}