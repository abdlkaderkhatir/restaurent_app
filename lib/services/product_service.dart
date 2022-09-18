import 'package:http/http.dart' as http;
import 'package:restaurant_app/models/product.dart';
import 'package:restaurant_app/utils/my_string.dart';


class ProductService {

    static Future<List<Product>>  getProducts() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}