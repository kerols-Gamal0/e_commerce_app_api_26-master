import 'dart:convert';

import 'package:ecommerce_app_api_26/core/api/end_point.dart';
import 'package:ecommerce_app_api_26/features/home/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  Future<List<ProductModel>> getAllProducts() async {
    Uri uri = Uri.parse(EndPoint.baseUrl + EndPoint.products);
    var response = await http.get(uri);
    var json = jsonDecode(response.body) as List;
    List<ProductModel> products = json
        .map((e) => ProductModel.fromJson(e))
        .toList();
    return products;
  }

  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
    Uri uri = Uri.parse(
      EndPoint.baseUrl + EndPoint.products + '?categoryId=$categoryId',
    );
    var response = await http.get(uri);
    var json = jsonDecode(response.body) as List;
    List<ProductModel> products = json
        .map((e) => ProductModel.fromJson(e))
        .toList();
    return products;
  }
}
