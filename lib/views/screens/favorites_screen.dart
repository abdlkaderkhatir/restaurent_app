import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/utils/theme.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor:context.theme.backgroundColor,
      body: 
          
             Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/images/heart.png",
                    color:Get.isDarkMode ? pinkClr : null,),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Please, Add your favorites products.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                      )),
                ],
              ),
            ),
          
          //  ListView.separated(
          //     itemBuilder: (context, index) {
          //       return buildFavItems();
          //     },
          //     separatorBuilder: (context, index) {
          //       return const Padding(
          //         padding: EdgeInsets.only(left:20,right: 20),
          //         child: Divider(
          //           color: Colors.grey,
          //           thickness: 2,
          //         ),
          //       );
          //     },
          //     itemCount: 3,
          //   ),
        
      );
  }

  Widget buildFavItems() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$ 109.95',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


