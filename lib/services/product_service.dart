import 'package:http/http.dart' as http;
import 'package:restaurant_app/models/product.dart';
import 'package:restaurant_app/utils/my_string.dart';


class ProductService {

   static Future<List<Product>>  getProducts() async {
    // List<Product> products=[];
      try{
          var response = await http.get(Uri.parse('$baseUrl/products'));

            if (response.statusCode == 200) {
              var jsonData = response.body;

              if (jsonData == null) {
                  return [];
              }
              return productFromJson(jsonData);
            } else {
              // return products;
              return throw Exception("Failed to load product");
            }
        }catch(e){
          return throw Exception(e.toString());
       }
  }
}