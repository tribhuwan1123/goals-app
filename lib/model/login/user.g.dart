// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int?,
      personnelId: json['personnelId'] as int?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      mobile: json['mobile'] as String?,
      joiningDate: json['joiningDate'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      heightFeet: (json['heightFeet'] as num?)?.toDouble(),
      heightInches: (json['heightInches'] as num?)?.toDouble(),
      chest: (json['chest'] as num?)?.toDouble(),
      waist: (json['waist'] as num?)?.toDouble(),
      arms: (json['arms'] as num?)?.toDouble(),
      image: json['image'] as String?,
      clientSource: json['clientSource'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      anniversary: json['anniversary'] as String?,
      occupation: json['occupation'] as String?,
      occupationDetails: json['occupationDetails'] as String?,
      resetPasswordToken: json['resetPasswordToken'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'personnelId': instance.personnelId,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'dob': instance.dob,
      'gender': instance.gender,
      'email': instance.email,
      'address': instance.address,
      'mobile': instance.mobile,
      'joiningDate': instance.joiningDate,
      'weight': instance.weight,
      'fat': instance.fat,
      'heightFeet': instance.heightFeet,
      'heightInches': instance.heightInches,
      'chest': instance.chest,
      'waist': instance.waist,
      'arms': instance.arms,
      'image': instance.image,
      'clientSource': instance.clientSource,
      'maritalStatus': instance.maritalStatus,
      'anniversary': instance.anniversary,
      'occupation': instance.occupation,
      'occupationDetails': instance.occupationDetails,
      'resetPasswordToken': instance.resetPasswordToken,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
