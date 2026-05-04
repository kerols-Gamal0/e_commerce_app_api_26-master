import 'dart:convert';

import 'package:ecommerce_app_api_26/core/api/end_point.dart';
import 'package:ecommerce_app_api_26/features/categories/data/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoriesApi {
  Future<List<CategoryModel>> getAllCategories() async {
    Uri url = Uri.parse(EndPoint.baseUrl + EndPoint.categories);
    var response = await http.get(url);
    List<dynamic> json = jsonDecode(response.body);
    List<CategoryModel> categories = json
        .map((e) => CategoryModel.fromJson(e))
        .toList();
    return categories;
  }
}
