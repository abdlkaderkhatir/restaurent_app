
import 'package:get/get.dart';
import 'package:restaurant_app/logic/controllers/main_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.put(MainController());
  }

}