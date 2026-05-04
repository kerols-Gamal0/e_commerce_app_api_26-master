import 'dart:convert';

import 'package:ecommerce_app_api_26/core/api/end_point.dart';
import 'package:ecommerce_app_api_26/core/cash/cash_helper.dart';
import 'package:ecommerce_app_api_26/features/profile/data/models/profile_error_model.dart';
import 'package:ecommerce_app_api_26/features/profile/data/models/profile_model.dart';
import 'package:http/http.dart' as http;

class ProfileApi {
  Future<ProfileModel> getProfile() async {
    Uri uri = Uri.parse(EndPoint.baseUrl + EndPoint.profile);
    String? token = await CacheHelper.getToken();
    var response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer $token'},
    );
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      ProfileModel profileModel = ProfileModel.fromJson(json);
      return profileModel;
    } else {
      ProfileErrorModel errorModel = ProfileErrorModel.fromJson(json);
      throw Exception(errorModel.message);
    }
  }
}
