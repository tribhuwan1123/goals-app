import 'package:fitness/model/login/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';

part 'login_response.g.dart';

@Freezed()
class LoginResponse with _$LoginResponse {
  factory LoginResponse({ User? user, String? token}) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}