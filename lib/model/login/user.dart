import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@Freezed()
class User with _$User {
  factory User({
    int? id ,
    int? personnelId ,
    String? firstName ,
    String? middleName ,
    String? lastName ,
    String? dob ,
    String? gender ,
    String? email ,
    String? address ,
    String? mobile ,
    String? joiningDate ,
    double? weight ,
    double? fat ,
    double? heightFeet ,
    double? heightInches ,
    double? chest ,
    double? waist ,
    double? arms ,
    String? image ,
    String? clientSource ,
    String? maritalStatus ,
    String? anniversary ,
    String? occupation ,
    String? occupationDetails ,
    String? resetPasswordToken ,
    String? createdAt ,
    String? updatedAt ,

  }) = _User;

  factory User.fromJson(Map<String, dynamic> json)=>_$UserFromJson(json);
}