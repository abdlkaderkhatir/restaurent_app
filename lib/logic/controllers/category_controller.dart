import 'package:get/get.dart';
import 'package:restaurant_app/models/product.dart';
import 'package:restaurant_app/services/category_service.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var isCatgeoryLoading = false.obs;

  List<String> imageCategory = [
    "https://images.pexels.com/photos/325153/pexels-photo-325153.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/11203727/pexels-photo-11203727.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/298863/pexels-photo-298863.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/934070/pexels-photo-934070.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  ].obs;
  var categoryList = <Product>[].obs;
  var isAllCategory = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getCategorys();
    super.onInit();
  }

  void getCategorys() async {
    var categoryName = await CategoryService.getCategories();

    try {
      isCatgeoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCatgeoryLoading(false);
    }
  }

  getAllCategorys(String namecategory) async {
    isAllCategory(true);
     categoryList.value =
        await AllCategorySercvises.getAllCatehory(namecategory);

    isAllCategory(false);
  }

  // getCategoryIndex(int index) async {
  //   var categoryAllName = await getAllCategorys(categoryNameList[index]);

  //   if (categoryAllName != null) {
  //     categoryList.value = categoryAllName;
  //   }
  // }
}
