import 'package:get/get.dart';
import 'package:restaurant_app/logic/bindings/auth_bindings.dart';
import 'package:restaurant_app/views/screens/auth/login_screen.dart';
import 'package:restaurant_app/views/screens/auth/signup_screen.dart';
import 'package:restaurant_app/views/screens/welcome_screen.dart';

class AppRoutes{

  static const initRoute=Routes.welcomeScreen;

  static final routes=[
    GetPage(name: Routes.welcomeScreen, page:()=>const WelcomeScreen()),
    GetPage(name: Routes.signUpScreen, page:()=>const SignupScreen(),binding: AuthBindings(),),
    GetPage(name: Routes.loginScreen, page:()=>const LoginScreen(), binding: AuthBindings()),
    // GetPage(name: Routes.loginScreen, page:()=>const LoginScreen(), binding: AuthBindings()),
  ];
}

class Routes {
  static const welcomeScreen = '/welcome';
  static const signUpScreen = '/signup';
  static const loginScreen = '/login';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/paymentScreen';
}