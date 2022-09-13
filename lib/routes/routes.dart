import 'package:get/get.dart';
import 'package:restaurant_app/views/screens/auth/login_screen.dart';
import 'package:restaurant_app/views/screens/auth/signup_screen.dart';
import 'package:restaurant_app/views/screens/welcome_screen.dart';

class AppRoutes{

  static const initRoute=Routes.welcomeScreen;

  static final routes=[
    GetPage(name: Routes.welcomeScreen, page:()=>const WelcomeScreen()),
    GetPage(name: Routes.loginScreen, page:()=>const LoginScreen()),
    GetPage(name: Routes.signUpScreen, page:()=>const SignupScreen()),
  ];
}

class Routes {
  static const welcomeScreen = '/welcome';
  static const loginScreen = '/login';
  static const signUpScreen = '/signup';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/paymentScreen';
}