import 'dart:convert';

import 'package:final_project/models/categories.dart';
import 'package:http/http.dart' as http;
import 'package:final_project/models/products.dart';

class Api{
  static Future<ProductsVm> getProduct()async{

    String url = "https://retail.amit-learning.com/api/products";

    final response = await http.get(Uri.parse(url));

    return ProductsVm.fromJson(Map<String, dynamic>.from(json.decode(response.body.toString())));
  }
  static Future<CategoriesVm> getCategories()async{

    String url = "https://retail.amit-learning.com/api/categories";

    final response = await http.get(Uri.parse(url));

    return CategoriesVm.fromJson(Map<String, dynamic>.from(json.decode(response.body.toString())));
  }
}