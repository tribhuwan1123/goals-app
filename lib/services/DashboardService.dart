import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fitness/model/attendance.dart';
import 'package:fitness/model/dashboard/dashboard.dart';
import 'package:fitness/model/subscriptions/subscription_model.dart';
import 'package:fitness/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/profile_model.dart';
import 'ApiException.dart';
import 'ApiService.dart';

class DashboardService with ChangeNotifier {
  int _statusCode = 200;

  int get statusCode => _statusCode;
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  late Dashboard dashboard;

  int? _totalSubs = 0;

  int? get totalSubs => _totalSubs;

  int? _notificationsCount = 0;

  int? get notificationsCount => _notificationsCount;

  List<Notifications>? _notifications = [];

  List<Notifications>? get notifications => _notifications;

  String? _totalAmountPaid = "0";

  String? get totalAmountPaid => _totalAmountPaid;

  String? mGender = "Male";

  String? get gender => mGender;
  String? firstName = "";
  String? middleName = "";
  String? maritalStatus = "";
  String? lastName = "";
  String? mobile = "";
  String? dob = "";
  String? email = "";
  String? profileImage = "";
  String? qrMessage = "";

  Profile _profile = Profile();

  Profile get profile => _profile;

  AttendanceResponse _attendanceResponse = AttendanceResponse();

  AttendanceResponse get attendanceResponse => _attendanceResponse;

  SubscriptionResponse _subscriptionResponse = SubscriptionResponse();

  SubscriptionResponse get subscriptionResponse => _subscriptionResponse;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> fetchDashboard() async {
    final SharedPreferences prefs = await _prefs;
    try {
      _isBusy = true;
      Response response = await ApiService().dio.get("/dashboard",
          options: Options(headers: {
            'Authorization': 'Bearer ${prefs.get(Constants().TOKEN)}'
          }));
      _statusCode = response.statusCode!;
      if (response.statusCode == 200) {
        dashboard = Dashboard.fromJson(response.data);
        _totalSubs = dashboard.data?.totalSubscriptions;
        _totalAmountPaid = dashboard.data?.totalAmountPaid;
        _notificationsCount = dashboard.data?.unreadNotifications;
        _notifications = dashboard.data?.notifications;
        profileImage = dashboard.data?.customerValues?.image;
        qrMessage = dashboard.data?.qrSubscription;
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

  Future<String> fetchProfile() async {
    final SharedPreferences prefs = await _prefs;
    try {
      _isBusy = true;
      Response response = await ApiService().dio.get("/profile",
          options: Options(headers: {
            'Authorization': 'Bearer ${prefs.get(Constants().TOKEN)}'
          }));
      _statusCode = response.statusCode!;
      if (response.statusCode == 200) {
        _profile = Profile.fromJson(response.data);

        mGender = _profile.data?.gender;
        firstName = _profile.data?.firstName;
        maritalStatus = _profile.data?.maritalStatus;
        dob = _profile.data?.dob;
        middleName = _profile.data?.middleName;
        lastName = _profile.data?.lastName;
        mobile = _profile.data?.mobile;
        email = _profile.data?.email;

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

  Future<String> updateProfile(Map<String, dynamic?> data) async {
    final SharedPreferences prefs = await _prefs;
    try {
      _isBusy = true;
      Response response = await ApiService().dio.post("/profile/store",
          options: Options(headers: {
            'Authorization': 'Bearer ${prefs.get(Constants().TOKEN)}'
          }),
          data: FormData.fromMap(data));
      _statusCode = response.statusCode!;
      if (response.statusCode == 200) {
        await fetchDashboard();
        notifyListeners();
        _isBusy = false;
        fetchProfile();
        return "Profile Updated Successfully";
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

  Future<String> fetchAttendance() async {
    final SharedPreferences prefs = await _prefs;
    try {
      _isBusy = true;
      Response response = await ApiService().dio.get("/attendance",
          options: Options(headers: {
            'Authorization': 'Bearer ${prefs.get(Constants().TOKEN)}'
          }));
      _statusCode = response.statusCode!;
      if (response.statusCode == 200) {
        _attendanceResponse = AttendanceResponse.fromJson(response.data);
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
  Future<String> fetchSubs() async {
    final SharedPreferences prefs = await _prefs;
    try {
      _isBusy = true;
      Response response = await ApiService().dio.get("/manage-subscription",
          options: Options(headers: {
            'Authorization': 'Bearer ${prefs.get(Constants().TOKEN)}'
          }));
      _statusCode = response.statusCode!;
      if (response.statusCode == 200) {
        _subscriptionResponse = SubscriptionResponse.fromJson(response.data);
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
