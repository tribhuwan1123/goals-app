import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitness/model/payments/payments.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/payments/due_payments.dart';
import '../model/payments/product_due_payments.dart';
import '../utils/constants.dart';
import 'ApiException.dart';
import 'ApiService.dart';

class MembershipService with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late DuePayments duePayments;
  late ProductDuePayments productDuePayments;
  late Payments payments;

  String? _invoice = "";

  String? get invoice => _invoice;

  Future<void> fetchDuePayments() async {
    final SharedPreferences prefs = await _prefs;
    try {
      Response response = await ApiService().dio.get("/membership/due-payments",
          options: Options(headers: {
            'Authorization': 'Bearer ${prefs.get(Constants().TOKEN)}'
          }));
      if (response.statusCode == 200) {
        duePayments = DuePayments.fromJson(response.data);
        notifyListeners();
      }
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

  Future<void> fetchProductDuePayments() async {
    final SharedPreferences prefs = await _prefs;
    try {
      Response response = await ApiService().dio.get(
          "/productPayments/due-payments",
          options: Options(headers: {
            'Authorization': 'Bearer ${prefs.get(Constants().TOKEN)}'
          }));
      if (response.statusCode == 200) {
        productDuePayments = ProductDuePayments.fromJson(response.data);
        notifyListeners();
      }
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

  Future<void> fetchPayments() async {
    final SharedPreferences prefs = await _prefs;
    try {
      Response response = await ApiService().dio.get("/payments",
          options: Options(headers: {
            'Authorization': 'Bearer ${prefs.get(Constants().TOKEN)}'
          }));
      if (response.statusCode == 200) {
        payments = Payments.fromJson(response.data);
        notifyListeners();
      }
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

  Future<void> fetchProductPayments() async {
    final SharedPreferences prefs = await _prefs;
    try {
      print("Token ${prefs.get(Constants().TOKEN)}");
      Response response = await ApiService().dio.get("/productPayments",
          options: Options(headers: {
            'Authorization': 'Bearer ${prefs.get(Constants().TOKEN)}'
          }));
      if (response.statusCode == 200) {
        payments = Payments.fromJson(response.data);
        notifyListeners();
      }
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

  Future<void> downloadInvoice(String id) async {
    final SharedPreferences prefs = await _prefs;
    try {
      print("Token ${prefs.get(Constants().TOKEN)}");
      Response response = await ApiService().dio.get(
          "/membership/download-invoice/${id}",
          options: Options(headers: {
            'Authorization': 'Bearer ${prefs.get(Constants().TOKEN)}'
          }));
      if (response.statusCode == 200) {
        _invoice = response.data.toString();
        notifyListeners();
      }
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
