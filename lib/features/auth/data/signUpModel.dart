class SignUpModel {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  String? creationAt;
  String? updatedAt;

  SignUpModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
    this.creationAt,
    this.updatedAt,
  });

  SignUpModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
}

class SignUpErrorModel {
  List<String>? message;
  String? error;
  int? statusCode;

  SignUpErrorModel({this.message, this.error, this.statusCode});

  SignUpErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'].cast<String>();
    error = json['error'];
    statusCode = json['statusCode'];
  }
}
