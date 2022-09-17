import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/routes/routes.dart';

class AuthMiddleware extends GetMiddleware{

    @override
    RouteSettings? redirect(String? route) {
      if(FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('auth') == true){
                 return RouteSettings(name: AppRoutes.mainSreen);
              }
                        
         
    }
}