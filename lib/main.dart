import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/Language/localization_app.dart';
import 'package:restaurant_app/logic/controllers/theme_controller.dart';
import 'package:restaurant_app/routes/routes.dart';
import 'package:restaurant_app/utils/my_string.dart';
import 'package:restaurant_app/utils/theme.dart';
import 'package:restaurant_app/views/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shop&Hope',
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>('lang').toString()),
      // locale: Intl.getCurrentLocale(),
      translations: LocaliztionApp(),
      fallbackLocale: Locale(ene),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: AppRoutes.initRoute,
      getPages: AppRoutes.routes,
    );
  }
}
 