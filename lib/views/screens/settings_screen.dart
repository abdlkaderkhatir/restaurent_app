import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/logic/controllers/auth_controller.dart';
import 'package:restaurant_app/logic/controllers/theme_controller.dart';
import 'package:restaurant_app/utils/theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  ThemeController().changesTheme();
                },
                child: Text(
                  "dark mode",
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                )),
            GetBuilder<AuthController>(builder: (_) {
              return TextButton(
                  onPressed: () {
                     Get.defaultDialog(
                          title: "Logout From App",
                          titleStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                          ),
                          middleText: 'Are you sure you need to logout',
                          middleTextStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                          ),
                          backgroundColor: Colors.grey,
                          radius: 10,
                          textCancel: " No ",
                          cancelTextColor: Colors.white,
                          textConfirm: " YES ",
                          confirmTextColor: Colors.white,
                          onCancel: () {
                            Get.back();
                          },
                          onConfirm: () {
                            controller.signOutFromApp();
                          },
                          buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                     );
                  },
                  child: Text(
                    "log out",
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ));
            })
          ],
        ),
      ),
    );
  }
}
