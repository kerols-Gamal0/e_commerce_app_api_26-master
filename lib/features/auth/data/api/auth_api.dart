import 'dart:convert';

import 'package:ecommerce_app_api_26/core/api/end_point.dart';
import 'package:ecommerce_app_api_26/features/auth/data/model.dart';
import 'package:ecommerce_app_api_26/features/auth/data/signUpModel.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> requestBody = {
      ApiKeys.email: email,
      ApiKeys.password: password,
    };
    Uri url = Uri.parse(EndPoint.baseUrl + EndPoint.login);
    var response = await http.post(
      url,
      body: jsonEncode(requestBody),
      headers: {"Content-Type": "application/json"},
    );
    var responseBody = response.body;
    var json = jsonDecode(responseBody);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TokenModel tokenModel = TokenModel.fromJson(json);
      return tokenModel;
    } else {
      ErrorModel errorModel = ErrorModel.fromJson(json);
      throw Exception(errorModel.message);
    }
  }

  Future<dynamic> signUp({
    required String name,
    required String email,
    required String password,
    required String avatar,
  }) async {
    Map<String, dynamic> requestBody = {
      ApiKeys.name: name,
      ApiKeys.email: email,
      ApiKeys.password: password,
      ApiKeys.avatar: avatar,
    };
    Uri url = Uri.parse(EndPoint.baseUrl + EndPoint.signUp);
    var response = await http.post(
      url,
      body: jsonEncode(requestBody),
      headers: {"Content-Type": "application/json"},
    );
    var responseBody = await response.body;
    var json = jsonDecode(responseBody);
    if (response.statusCode == 200 || response.statusCode == 201) {
      SignUpModel signUpModel = SignUpModel.fromJson(json);
      return signUpModel;
    } else {
      SignUpErrorModel signUpErrorModel = SignUpErrorModel.fromJson(json);
      throw Exception(signUpErrorModel.message);
    }
  }
}
