class TokenModel {
  String? accessToken;
  String? refreshToken;

  TokenModel({this.accessToken, this.refreshToken});

  TokenModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }
}

class ErrorModel {
  String? message;
  int? statusCode;

  ErrorModel({this.message, this.statusCode});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
  }
}
