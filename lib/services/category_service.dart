import 'package:http/http.dart' as http;
import 'package:restaurant_app/models/category.dart';
import 'package:restaurant_app/models/product.dart';
import 'package:restaurant_app/utils/my_string.dart';

class CategoryService {
  static Future<List<String>> getCategories() async {
    // List<Product> products=[];
    try {
      var response = await http.get(Uri.parse('$baseUrl/products/categories'));

      if (response.statusCode == 200) {
        var jsonData = response.body;

        if (jsonData == null) {
          return [];
        }
        return categoryFromJson(jsonData);
      } else {
        // return products;
        return throw Exception("Failed to load product");
      }
    } catch (e) {
      return throw Exception(e.toString());
    }
  }
}

class AllCategorySercvises {
  static Future<List<Product>> getAllCatehory(String categoryNames) async {
    var response =
        await http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}