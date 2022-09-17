




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/utils/theme.dart';
import 'package:restaurant_app/views/widgets/text_utils.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);

  // final controller = Get.find<ProductController>();

  // final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
        return Expanded(
          child: GridView.builder(
            padding: EdgeInsets.only(left:10,right:10),
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9.0,
                    crossAxisSpacing: 6.0,
                    maxCrossAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    // if (controller.searchList.isEmpty) {
                      return buildCardItems(
                          image: "https://th.bing.com/th/id/OIP.QGZsVQmfGKqG_anApDaPnAHaKX?pid=ImgDet&w=1000&h=1400&rs=1",
                          price: 99.9,
                          rate: 4,
                          productId: 1,
                          // productModels: controller.productList[index],
                          onTap: () {
                            // Get.to(() => ProductDetailsScreen(
                            //       productModels: controller.productList[index],
                            //     ));
                          });
                    // } 
                  },
                ),
        );
      
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,

    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top:5.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                       
                      },
                      icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                    ),
                    IconButton(
                      onPressed: () {
                     
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              text: "$rate",
                              color: Colors.white,
                              underLine: TextDecoration.none,
                            ),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}