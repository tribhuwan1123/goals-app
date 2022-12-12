class LoginError {
  String? errorMessage;

  LoginError({this.errorMessage});

  LoginError.fromJson(Map<String, dynamic> json) {
    errorMessage = json['error_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_message'] = this.errorMessage;
    return data;
  }
}