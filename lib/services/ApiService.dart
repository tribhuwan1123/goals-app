import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiService {
  String baseUrl = 'https://gym.hamrofitness.com/api/customer';

  late final Dio dio = Dio(
    BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
        responseType: ResponseType.json,
        headers: {'Accept': 'application/json', 'Authorization': ''}),
  );
}
