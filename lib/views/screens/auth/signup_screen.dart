import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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


  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: SingleChildScrollView(
                child: Column(children: [
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
                            color: mainColor,
                            underLine: TextDecoration.none,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            text: "UP",
                            color: Colors.black,
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
                            // if (value.toString().length <= 2 ||
                            //     // !RegExp(validationName).hasMatch(value)) {
                            //   return 'Enter valid name';
                            // } else {
                              return null;
                            // }
                          },
                          prefixIcon:  Image.asset('assets/images/user.png'),
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
                            // if (value.toString().length <= 2 ||
                            //     // !RegExp(validationName).hasMatch(value)) {
                            //   return 'Enter valid name';
                            // } else {
                              return null;
                            // }
                          },
                          prefixIcon:  Image.asset('assets/images/email.png'),
                          suffixIcon: const Text(""),
                          hintText: 'Email',
                        ),
                         const SizedBox(
                        height: 20,
                      ),
                      AuthTextFormField(
                          controller: passwordController,
                          obscureText: false,
                          validator: (value) {
                            // if (value.toString().length <= 2 ||
                            //     // !RegExp(validationName).hasMatch(value)) {
                            //   return 'Enter valid name';
                            // } else {
                              return null;
                            // }
                          },
                          prefixIcon:  Image.asset('assets/images/lock.png'),
                          suffixIcon: const Text(""),
                            hintText: 'Password',
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CheckWidget(),
                        const SizedBox(
                          height: 50,
                        ),

                        AuthButton(
                              onPressed: () {
                              },
                              text: "SIGN UP",
                            ),
                    ],
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Already have an Account? ',
                textType: "Log in",
                onPressed: () {
                  // Get.offNamed(Routes.loginScreen);
                },
              ),
            ]))));
  }
}
