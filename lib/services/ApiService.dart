import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiService {
  String baseUrl = 'https://gym.hamrofitness.com/api/customer';
  String baseUrlMerchant = 'https://gym.hamrofitness.com/api';

  late final Dio dio = Dio(
    BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 50000,
        receiveTimeout: 30000,
        responseType: ResponseType.json,
        headers: {'Accept': 'application/json', 'Authorization': ''}),
  );

  late final Dio dioMerchant = Dio(
    BaseOptions(
        baseUrl: baseUrlMerchant,
        connectTimeout: 50000,
        receiveTimeout: 30000,
        responseType: ResponseType.json,
        headers: {'Accept': 'application/json', 'Authorization': ''}),
  );
}
