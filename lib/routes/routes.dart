import 'package:get/get.dart';
import 'package:restaurant_app/logic/bindings/auth_bindings.dart';
import 'package:restaurant_app/logic/bindings/main_bindings.dart';
import 'package:restaurant_app/logic/bindings/product_bindings.dart';
import 'package:restaurant_app/middleware/auth_middleware.dart';
import 'package:restaurant_app/views/screens/auth/forgot_password_screen.dart';
import 'package:restaurant_app/views/screens/auth/login_screen.dart';
import 'package:restaurant_app/views/screens/auth/signup_screen.dart';
import 'package:restaurant_app/views/screens/main_screen.dart';
import 'package:restaurant_app/views/screens/welcome_screen.dart';

class AppRoutes{

  static const initRoute=Routes.welcomeScreen;
  static const mainSreen=Routes.mainScreen;

  static final routes=[
    GetPage(name: Routes.welcomeScreen, page:()=>const WelcomeScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.signUpScreen, page:()=>const SignupScreen(),binding: AuthBindings(),),
    GetPage(name: Routes.loginScreen, page:()=>const LoginScreen(), binding: AuthBindings()),
    GetPage(name: Routes.forgotPasswordScreen, page:()=>const ForgotPasswordScreen(), binding: AuthBindings()),
    GetPage(
      name: Routes.mainScreen,
      page:()=>const MainScreen(), 
      bindings: [
        MainBindings(),
        AuthBindings(),
        ProductBindings()]),
  ];
}

class Routes {
  static const welcomeScreen = '/welcome';
  static const signUpScreen = '/signup';
  static const loginScreen = '/login';
  static const forgotPasswordScreen = '/forgotpassword';
  static const mainScreen = '/main';
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/paymentScreen';
}