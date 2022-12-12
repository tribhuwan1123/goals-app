import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitness/model/login/login_error.dart';
import 'package:fitness/model/login/login_response.dart';
import 'package:fitness/model/login/user_model.dart';
import 'package:fitness/services/ApiService.dart';
import 'package:fitness/utils/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ApiException.dart';

class LoginService with ChangeNotifier {
  int _statusCode = 200;

  int get statusCode => _statusCode;
  bool _isBusy = false;

  bool get isBusy => _isBusy;
  String message = "";

  LoginResponse _loginResponse = LoginResponse();

  LoginResponse get loginResponse => _loginResponse;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(Constants().TOKEN, "");
  }
  Future<String> login(UserModel user) async {
    final SharedPreferences prefs = await _prefs;
    try {
      _isBusy = true;
      var data = <String, String>{};
      data["email"] = user.email;
      data["password"] = user.password;
      data["device_name"] = "android";
      Response response =
          await ApiService().dio.post("/login", data: FormData.fromMap(data));
      _statusCode = response.statusCode!;
      if (response.statusCode == 200) {
        _loginResponse = LoginResponse.fromJson(response.data);
        if (_loginResponse.user == null) {
          throw ApiException(LoginError.fromJson(response.data).errorMessage ??
              "Login Failed");
        }
        prefs.setString(Constants().TOKEN, _loginResponse.token!);
        _isBusy = false;
        return "Login Successfully.";
      }
      _isBusy = false;
      return "Login Successful.";
    } on DioError catch (e) {
      notifyListeners();
      if (e.response != null) {
        Map<String, dynamic> response = jsonDecode(e.response.toString());
        throw ApiException(response['message']);
      } else {
        throw ApiException("Unable to login...");
      }
    }
  }
}
