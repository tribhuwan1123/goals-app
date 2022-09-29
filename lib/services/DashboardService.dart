import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitness/model/dashboard/dashboard.dart';
import 'package:fitness/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ApiException.dart';
import 'ApiService.dart';

class DashboardService with ChangeNotifier {
  int _statusCode = 200;

  int get statusCode => _statusCode;
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  late Dashboard dashboard;

  int _totalSubs = 0;

  int get totalSubs => _totalSubs;

  String _totalAmountPaid = "0";

  String get totalAmountPaid => _totalAmountPaid;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> fetchDashboard() async {
    final SharedPreferences prefs = await _prefs;
    try {
      _isBusy = true;
      var data = <String, String>{};
      Response response = await ApiService().dio.post("/dashboard",
          options: Options(headers: {
            'Authorization': 'Bearer ${prefs.get(Constants().TOKEN)}'
          }));
      _statusCode = response.statusCode!;
      if (response.statusCode == 200) {
        dashboard = Dashboard.fromJson(response.data);
        _totalSubs = dashboard.data.totalSubscriptions;
        _totalAmountPaid = dashboard.data.totalAmountPaid;
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
        throw ApiException(response['message']);
      } else {
        throw ApiException("Something went wrong.");
      }
    }
  }
}
