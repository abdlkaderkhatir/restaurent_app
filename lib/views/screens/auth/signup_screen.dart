import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/logic/controllers/auth_controller.dart';
import 'package:restaurant_app/routes/routes.dart';
import 'package:restaurant_app/utils/my_string.dart';
import 'package:restaurant_app/utils/theme.dart';
import 'package:restaurant_app/views/widgets/auth/auth_button.dart';
import 'package:restaurant_app/views/widgets/auth/auth_text_form_field.dart';
import 'package:restaurant_app/views/widgets/auth/check_widget.dart';
import 'package:restaurant_app/views/widgets/auth/container_under.dart';
import 'package:restaurant_app/views/widgets/text_utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor:  Get.isDarkMode ? darkGreyClr : Colors.white,
            appBar: AppBar(
              backgroundColor:  Get.isDarkMode ? darkGreyClr : Colors.white,
              elevation: 0,
            ),
            body: SingleChildScrollView(
                child: 
                      Form(
                        key: formKey,
                        child: Column(
                            children: [
                                      Container(
                                        width: double.infinity,
                                        height: MediaQuery.of(context).size.height / 1.3,
                                        // color: kCOlor1,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  TextUtils(
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.w500,
                                                    text: "SIGN",
                                                    color: Get.isDarkMode ? pinkClr : mainColor,
                                                    underLine: TextDecoration.none,
                                                  ),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  TextUtils(
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.w500,
                                                    text: "UP",
                                                    color:  Get.isDarkMode ? Colors.white : Colors.black,
                                                    underLine: TextDecoration.none,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 50,
                                              ),
                                              
                                              AuthTextFormField(
                                                  controller: nameController,
                                                  obscureText: false,
                                                  validator: (value) {
                                                    if (value.toString().length <= 3 ||
                                                        !RegExp(validationName).hasMatch(value)) {
                                                      return 'Enter valid name';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  prefixIcon:   Get.isDarkMode
                                                      ? const Icon(
                                                          Icons.person,
                                                          color: pinkClr,
                                                          size: 30,
                                                        )
                                                      : Image.asset('assets/images/user.png'),
                                                  suffixIcon: const Text(""),
                                                  hintText: 'User Name',
                                                ),
                                                const SizedBox(
                                                height: 20,
                                              ),
                                              AuthTextFormField(
                                                  controller: emailController,
                                                  obscureText: false,
                                                  validator: (value) {
                                                    if (value.toString().length <= 2 ||
                                                        !RegExp(validationEmail).hasMatch(value)) {
                                                      return 'Enter valid email';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  prefixIcon:  Get.isDarkMode
                                                      ? const Icon(
                                                          Icons.email,
                                                          color: pinkClr,
                                                          size: 30,
                                                        )
                                                      : Image.asset('assets/images/email.png'),
                                                  suffixIcon: const Text(""),
                                                  hintText: 'Email',
                                                ),
                                                const SizedBox(
                                                height: 20,
                                              ),
                                              // TODO:make password auth text formfield in GETBUILDER
                                              GetBuilder<AuthController>(builder: (_){
                                                return AuthTextFormField(
                                                  controller: passwordController,
                                                  obscureText: controller.isVisibilty ? false : true,
                                                  validator: (value) {
                                                    if (value.toString().length < 6) {
                                                          return 'Password should be longer or equal to 6 characters';
                                                        } else {
                                                          return null;
                                                        }
                                                  },
                                                  hintText: 'Password',
                                                  prefixIcon: Get.isDarkMode
                                                          ? const Icon(
                                                              Icons.lock,
                                                              color: pinkClr,
                                                              size: 30,
                                                            )
                                                          : Image.asset('assets/images/lock.png'),
                                                  suffixIcon: IconButton(
                                                    onPressed: () {
                                                      controller.visibility();
                                                    },
                                                    icon: controller.isVisibilty
                                                        ? const Icon(
                                                            Icons.visibility_off,
                                                            color: Colors.black,
                                                          )
                                                        : const Icon(
                                                            Icons.visibility,
                                                            color: Colors.black,
                                                          ),
                                                  ),
                                                );
                                              }),
                                                const SizedBox(
                                                  height: 50,
                                                ),
                                                CheckWidget(),
                                                const SizedBox(
                                                  height: 50,
                                                ),
                                              GetBuilder<AuthController>(builder: (_){
                                                return 
                                                AuthButton(
                                                      onPressed: () async {

                                                        if(formKey.currentState!.validate()){
                                                           controller.signUpUsingFirebase(
                                                            name: nameController.text.trim(), 
                                                            email: emailController.text.trim(), 
                                                            password: passwordController.text.trim());
                                                        }
                                                       
                                                      },
                                                      text: "SIGN UP",
                                                    );
                                              })
                                            ],
                                          ),
                                        ),
                                      ),
                                      ContainerUnder(
                                        text: 'Already have an Account? ',
                                        textType: "Log in",
                                        onPressed: () {
                                          Get.offNamed(Routes.loginScreen);
                                        },
                                      ),
                            ]),
                      )
                              )
                                )
                                  );
    }
}
