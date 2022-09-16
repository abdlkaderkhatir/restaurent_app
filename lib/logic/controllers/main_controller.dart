
import 'package:get/get.dart';
import 'package:restaurant_app/views/screens/category_screen.dart';
import 'package:restaurant_app/views/screens/favorites_screen.dart';
import 'package:restaurant_app/views/screens/home_screen.dart';
import 'package:restaurant_app/views/screens/settings_screen.dart';

class MainController extends GetxController {

  RxInt currentIndex = 0.obs;

  var tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;

  var title = [
    "Shop ",
    "Categories",
    'Favourites',
    "Settings",
  ].obs;

}