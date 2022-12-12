import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitness/model/merchant/merchant_info.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ApiException.dart';
import 'ApiService.dart';

class MerchantService with ChangeNotifier {
  int _statusCode = 200;

  int get statusCode => _statusCode;
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  late MerchantInfo merchantInfo;

  Future<String> fetchMerchantInfo(String id) async {
    try {
      _isBusy = true;
      Response response = await ApiService().dioMerchant.get(
            "/merchant-info/$id}",
          );
      _statusCode = response.statusCode!;
      if (response.statusCode == 200) {
        merchantInfo = MerchantInfo.fromJson(response.data);
        notifyListeners();
        _isBusy = false;
        return "Success";
      }
      _isBusy = false;
      return "Something went wrong.";
    } on DioError catch (e) {
      notifyListeners();
      if (e.response != null) {
        Map<String, dynamic> response = jsonDecode(e.response.toString());
        print(response['message']);
        throw ApiException(response['message']);
      } else {
        throw ApiException("Something went wrong.");
      }
    }
  }
}
