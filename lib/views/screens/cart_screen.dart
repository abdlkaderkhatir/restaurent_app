import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/utils/theme.dart';
import 'package:restaurant_app/views/widgets/cart/empty_cart.dart';
import 'package:restaurant_app/views/widgets/cart/product_items.dart';
import 'package:restaurant_app/views/widgets/text_utils.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text("Cart Items"),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.backspace),
            ),
          ],
        ),
        body:

            //     // if (controller.productsMap.isEmpty) {
            //  const EmptyCart(),
            //     // }

            //     //  else {
            //     //   return
            //     Container(
            //       child:
            Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ProductItem(
                      //                         // index: index,
                      //                         // productModels:
                      //                         //     controller.productsMap.keys.toList()[index],
                      //                         // quantity:
                      //                         //     controller.productsMap.values.toList()[index],
                      );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 3.0, 20.0, 0.0),
            child: Container(
              height: 100.0,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        text: "Total",
                        color: Colors.grey,
                        underLine: TextDecoration.none,
                      ),
                      Text(
                        "\$330",
                        style: TextStyle(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 0,
                          primary: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                        onPressed: () {
                      
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Check Out",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.shopping_cart),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
