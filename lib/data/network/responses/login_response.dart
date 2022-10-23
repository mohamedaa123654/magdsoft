class LoginResponse {
  int? status;
  String? message;
  String? code;

  LoginResponse({this.status, this.message, this.code});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
  }
}
